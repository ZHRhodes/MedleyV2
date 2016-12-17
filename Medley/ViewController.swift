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
		print(FBSDKAccessToken.current().tokenString)
		//if(MedleySession.shared.socialMediaProvider.isLoggedIn()){
		//	print("already logged on!")
		//}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func facebookLoginClick(_ sender: Any) {
		
		MedleySession.shared.login(withProvider: FacebookManager(), sender: self)
		
	}

	@IBAction func logoutClick(_ sender: Any) {
		MedleySession.shared.logout()
	}
	
}

