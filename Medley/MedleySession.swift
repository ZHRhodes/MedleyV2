//
//  MedleySession.swift
//  Medley
//
//  Created by Zack Rhodes on 12/15/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import Foundation
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

protocol FirebaseLoginDelegate {
	func login(withCredential credential: FIRAuthCredential)
}

class MedleySession: FirebaseLoginDelegate {
	static let shared = MedleySession()
	
	var socialMediaProvider: SocialMediaProvider!
	
	private init(){}
	
	func login(withProvider provider: SocialMediaProvider, sender: UIViewController){
		socialMediaProvider = provider
		provider.login(sender: sender)
	}
	
	func login(withCredential credential: FIRAuthCredential){
		FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
			if let error = error {
			print("Firebase Facebook login failed. Error \(error)")
			}else {
			print("Firebase Facebook login successful. User \(user)")
			}
		})
	}
	
	func logout(){
		do {
			try FIRAuth.auth()?.signOut()
		} catch {
			print("log out failed")
		}
	}
	
	//login canceled

}
