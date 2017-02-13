//
//  ViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 12/14/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class LoginRootViewController: UIViewController, FirebaseLoginResponseDelegate {

	var loggedInStateHandle: FIRAuthStateDidChangeListenerHandle!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		//print(FBSDKAccessToken.current().tokenString)
		//if(MedleySession.shared.socialMediaProvider.isLoggedIn()){
		//	print("already logged on!")
		//}
		
		loggedInStateHandle = FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
			if user != nil {
				//let storyboard = UIStoryboard(name: "Main", bundle: nil)
				//let controller = storyboard.instantiateViewController(withIdentifier: "MainRootVC")
				//self.present(controller, animated: true, completion: nil)
				
				

					
					
			} else {
				print("user hasn't logged in yet")
			}
		})
		
	}

	func viewDidDisappear(){
		print("View DID DISappearing!")
		FIRAuth.auth()?.removeStateDidChangeListener(loggedInStateHandle)

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func facebookLoginTapped(_ sender: Any) {
		MedleySession.sharedInstance.login(withProvider: FacebookManager(), sender: self, loginResponseDelegate: self) //sharedinstance
	}
	
	func handleUserLogin(isNewUser: Bool) {
		print("IS NEW USER??? \(isNewUser)")
		if(isNewUser){//isNewUser){
			performSegue(withIdentifier: SegueIdentifiers.LoginRootToUsername.rawValue, sender: self)
		}else{
			//performSegue(withIdentifier: "logintomainroot", sender: self)

			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let controller = storyboard.instantiateViewController(withIdentifier: "MainTabController")
			self.present(controller, animated: true, completion: nil)
		}
	}
	
	
}

