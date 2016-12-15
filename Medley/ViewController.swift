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

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		if((FBSDKAccessToken.current()) != nil){
			print("already logged on!")
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func facebookLoginClick(_ sender: Any) {
		
		let facebookLogin = FBSDKLoginManager()
		print("logging in")
		
		facebookLogin.logIn(withReadPermissions: ["email", "public_profile"], from: self, handler: {
			(facebookResult, facebookError) -> Void in
			if facebookError != nil {
				print("Facebook login failed. Error \(facebookError)")
			}else if (facebookResult?.isCancelled)! {
				print("Facebook login was cancelled")
			}else {
				print("Facebook login successful")
				let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
				FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
					if let error = error {
						print("Firebase Facebook login failed. Error \(error)")
					}else {
						print("Firebase Facebook login successful. User \(user)")
					}
				})
			}
		})
		
	}
	


}

