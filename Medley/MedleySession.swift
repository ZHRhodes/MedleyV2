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

protocol FirebaseLoginResponseDelegate {
	func handleUserLogin(isNewUser: Bool)
}

class MedleySession {
	static let sharedInstance = MedleySession()
	
	private(set) var isNewUser: Bool?
	var loginResponseDelegate: FirebaseLoginResponseDelegate?
	var ref: FIRDatabaseReference = FIRDatabase.database().reference()
	var musicProvider: MusicProvider?
	
	private init(){}
	
	//this is a lot of coupling!
	//check if already logged in?
	func login(withProvider provider: SocialMediaProvider, sender: UIViewController, loginResponseDelegate: FirebaseLoginResponseDelegate){
		self.loginResponseDelegate = loginResponseDelegate
		provider.login(sender: sender, session: self)
	}
	
	func login(withCredential credential: FIRAuthCredential){
		FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
			if let error = error {
			print("Firebase Facebook login failed. Error \(error)")
			}else {
			print("Firebase Facebook login successful. User \(user)")
				FIRDatabase.database().reference().child("users").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
					// Check if user already exists
					self.isNewUser = !snapshot.exists()
					self.loginResponseDelegate?.handleUserLogin(isNewUser: self.isNewUser!)
				})
			}
		})
	}
	
	static func logout(){
		do {
			try FIRAuth.auth()?.signOut()
		} catch {
			print("log out failed")
		}
	}
		
	//login canceled
	
	func login(withMusicProvider provider: MusicProvider){
		self.musicProvider = provider
	}

}
