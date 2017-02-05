//
//  SocialMediaProvider.swift
//  Medley
//
//  Created by Zack Rhodes on 12/15/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit

protocol SocialMediaProvider {
	var type: LoginProvider { get }
	func login(sender: UIViewController, session: MedleySession)
	//func logout()
	func isLoggedIn()->Bool
}
