//
//  MainRootVC.swift
//  Medley
//
//  Created by Zack Rhodes on 12/21/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import Foundation
import UIKit

class MainRootVC: UIViewController {
	override func viewDidLoad(){
		
	}

	@IBAction func logoutTapped(_ sender: Any) {
		MedleySession.logout()
	}
	
	@IBAction func addFriendsTapped(_ sender: Any) {
		performSegue(withIdentifier: SegueIdentifiers.MainToFriendSearch.rawValue, sender: self)
	}
	
}
