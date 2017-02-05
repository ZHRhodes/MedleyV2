//
//  FriendSearchViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 12/24/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import Foundation
import UIKit

class FriendSearchViewController : UIViewController {
	
}

extension FriendSearchViewController : UITableViewDelegate {

}

extension FriendSearchViewController : UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
