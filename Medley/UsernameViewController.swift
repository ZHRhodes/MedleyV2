//
//  UsernameViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 12/22/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class UsernameViewController: UIViewController {
	@IBOutlet var usernameTextField: UITextField!
	
	/*should this stuff be done in a model?*/
	@IBAction func goTapped(_ sender: Any) {
		guard let uname = usernameTextField.text else {
			print("username can't be empty")
			return
		}
		let changeRequest = FIRAuth.auth()?.currentUser?.profileChangeRequest()
		changeRequest?.displayName = uname
		changeRequest?.commitChanges(completion: { (error) in
			guard error == nil else {
				print(error ?? "uname error unknown!")
				return
			}
		
			let usersRef = FIRDatabase.database().reference().child("users")
			usersRef.queryOrdered(byChild: "username").queryEqual(toValue: uname).observeSingleEvent(of: .value, with: { (snapshot) in
				if snapshot.value is NSNull {
					usersRef.child((FIRAuth.auth()?.currentUser?.uid)!).setValue(["username":uname,
					                                                              "following":0,
					                                                              "followers":0])
					print("performing segue!!")
					//self.performSegue(withIdentifier: "usernametomainroot", sender: self)
					let storyboard = UIStoryboard(name: "Main", bundle: nil)
					let controller = storyboard.instantiateViewController(withIdentifier: "MainTabController")
					self.present(controller, animated: true, completion: nil)
				}else{
					print("username is unavailable. Snapshot: \(snapshot.value)")
				}
			})
		})
	}
	
}
