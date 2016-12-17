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
	func login(sender: UIViewController)
	//func logout()
	func isLoggedIn()->Bool
}
