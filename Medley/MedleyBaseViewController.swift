//
//  MedleyBaseViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 3/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit

class MedleyBaseViewController: UIViewController {
	
	func showPostExplorer(_ post: MusicPostViewModel){
		print("showing post: \(post.song)")
		if let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardIDs.PostExplorer){
			let vc = vc as! PostExplorerViewController
			let vm = PostExplorerViewModel(post)
			vc.set(viewModel: vm)
			self.present(vc, animated: true) {
				//
			}
		}
	}
	
	func showUserProfile(_ user: UserViewModel){
		print("showing user: \(user.username)")
		if let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardIDs.UserProfile){
			let vc = vc as! UserProfileViewController
			let vm = UserProfileViewModel(user)
			vc.set(viewModel: vm)
			self.present(vc, animated: true){
				//
			}
		}
	}
	
}
