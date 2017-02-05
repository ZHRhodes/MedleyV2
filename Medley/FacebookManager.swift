//
//  FacebookManager.swift
//  Medley
//
//  Created by Zack Rhodes on 12/15/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit

class FacebookManager: SocialMediaProvider {	
	var loginManager = FBSDKLoginManager()
	var type: LoginProvider {
		get {
			return LoginProvider.Facebook
		}
	}

	func login(sender: UIViewController, session: MedleySession){
		
		print("logging in ")
		
		loginManager.logIn(withReadPermissions: ["email","public_profile"], from: sender, handler: {
			(facebookResult, facebookError) -> Void in
			if facebookError != nil {
				print("Facebook login failed. Error \(facebookError)")
			}else if (facebookResult?.isCancelled)! {
				print("Facebook login was cancelled")
			}else {
				print("Facebook login successful")
				let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
				session.login(withCredential: credential)
			}
		})
	}
	
	func isLoggedIn()->Bool {
		return FBSDKAccessToken.current() != nil
	}
}
