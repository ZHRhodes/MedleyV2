//
//  FeedCell.swift
//  Medley
//
//  Created by Zack Rhodes on 2/13/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

//protocol FeedCell {
//	var subscribed: Bool { get set } //maybe not ideal but works
//	func getArtTaps() -> Observable<MusicPostViewModel>
//	func getProfileTaps() -> Observable<User>
//	func setViewModel(newViewModel: MusicPostViewModel)
//}

class FeedCell: UITableViewCell {
	
	@IBOutlet var userPic: UIImageView!
	@IBOutlet var username: UILabel!
	@IBOutlet var timeSince: UILabel!
	
	@IBOutlet var postPlayer: PostPlayerView!
	
	var post = PublishSubject<MusicPost>()
	var curPost: MusicPost!
	
	private var artTaps = PublishSubject<MusicPost?>()
	
	func getArtTaps() -> Observable<MusicPost?> {
		return artTaps
	}
	
	private var profileTaps = PublishSubject<User>()
	
	func getProfileTaps() -> Observable<User>{
		return profileTaps
	}
	
	var subscribed: Bool = false
	
	let disposeBag = DisposeBag()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupRx()
	}
	
	private func setupRx(){
		post.subscribe(onNext: { [weak self] post in
			self?.curPost = post
			if(post.viewModel.shouldExpandByLikes(param: 20)){
				self?.postPlayer = PostPlayerBig.loadFromNib()
			}else{
				self?.postPlayer = PostPlayerSmall.loadFromNib()
			}
			self?.postPlayer.setViewModel(newViewModel: post.viewModel)
			self?.setNeedsLayout()
		}).addDisposableTo(disposeBag)
		
		postPlayer.getArtTaps().subscribe(onNext: { [weak self] t in
			self?.artTaps.onNext(self?.curPost)
		}).addDisposableTo(disposeBag)
		
		userPic.addTapRecognizer(sender: self, sel: #selector(FeedCell.profileTapped))
		username.addTapRecognizer(sender: self, sel: #selector(FeedCell.profileTapped))
	}
	
	func setPost(post: MusicPost){
		self.post.onNext(post)
	}
	
	func profileTapped(){
		profileTaps.onNext(curPost.user!)
	}
	
}
