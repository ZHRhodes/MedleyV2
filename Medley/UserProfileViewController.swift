//
//  UserProfile.swift
//  Medley
//
//  Created by Zack Rhodes on 3/11/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class UserProfileViewController: UIViewController {
	
	var viewModel: UserProfileViewModel!
	
	let disposeBag = DisposeBag()
	
	@IBOutlet var userPic: UIImageView!
	@IBOutlet var usernameLabel: UILabel!
	@IBOutlet var followersLabel: UILabel!
	@IBOutlet var followingLabel: UILabel!
	@IBOutlet var jamsLabel: UILabel!
	
	func set(viewModel: UserProfileViewModel){
		self.viewModel = viewModel
	}
	
	override func viewDidLoad() {
		setupRx()
		setupSwipes()
	}
	
	private func setupRx(){
		viewModel.getUserViewModel().asObservable().subscribe(onNext: { [weak self] user in
			self?.userPic.sd_setImage(with: user.profilePicture, completed: { (image, error, cacheType, url) in
				self?.userPic.image = image?.circle
			})
			self?.usernameLabel.text = user.username
			self?.followersLabel.text = "Followers: " + String(describing: user.followers!)
			self?.followingLabel.text = "Following: " + String(describing: user.following!)
			self?.jamsLabel.text = "Jams: " + String(describing: user.jams!)
			
			self?.usernameLabel.heroID = user.heroID.username
			self?.userPic.heroID = user.heroID.profilePic
		}).addDisposableTo(disposeBag)
	}
	
	/* TEMPORARY??? */
	private func setupSwipes(){
		let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(PostExplorerViewController.handleSwipes(sender:)))
		downSwipe.direction = .down
		view.addGestureRecognizer(downSwipe)
	}
	
	func handleSwipes(sender:UISwipeGestureRecognizer){
		hero_unwindToRootViewController()
	}
	/*             */
	
}
