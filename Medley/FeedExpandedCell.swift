//
//  FeedExpandedCell.swift
//  Medley
//
//  Created by Zack Rhodes on 2/13/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift
import SDWebImage
import UIKit
import Hero

class FeedExpandedCell: UITableViewCell, FeedCell {
	
	var viewModel = PublishSubject<MusicPostViewModel>()
	
	var subscribed: Bool = false

	var artTap: Observable<MusicPostViewModel>!
	var profileTap: PublishSubject<UserViewModel>!
	
	func getArtTaps() -> Observable<MusicPostViewModel> {
		return artTap
	}
	
	func getProfileTaps() -> Observable<UserViewModel> {
		return profileTap
	}
	
	var curViewModel: MusicPostViewModel! //this sucks and sorta circumvents reactive practice. should revisit! basically making this a Variable that doesn't emit to new subscribers. but assumed there will be a model there when clicked
	
	func setViewModel(newViewModel: MusicPostViewModel){
		self.viewModel.onNext(newViewModel)
	}
	
	@IBOutlet var postBackground: PostPlayerView!
	
	@IBOutlet var profilePic: UIImageView!
	@IBOutlet var username: UILabel!
	@IBOutlet var timeSincePost: UILabel!
	
	
	@IBOutlet var albumArt: UIButton!
	@IBOutlet var songName: UILabel!
	@IBOutlet var artist: UILabel!
	
	
	let disposeBag = DisposeBag()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupRx()
	}
	
	/*what goes in the model!?*/
	private func setupRx() {
		viewModel.subscribe(onNext: { [weak self] viewModel in
			self?.albumArt.heroID = viewModel.heroID.album
			self?.songName.heroID = viewModel.heroID.song
			self?.artist.heroID = viewModel.heroID.artist
			self?.postBackground.heroID = viewModel.heroID.bg
			self?.username.heroID = viewModel.userViewModel.heroID.username
			self?.profilePic.heroID = viewModel.userViewModel.heroID.profilePic
			
			self?.curViewModel = viewModel
			self?.username.text = viewModel.userViewModel.username
			self?.songName.text = viewModel.song.name
			self?.artist.text = viewModel.song.album
			self?.albumArt.sd_setBackgroundImage(with: viewModel.song.urlBig, for: .normal)
			self?.profilePic.sd_setImage(with: viewModel.userViewModel.profilePicture, completed: { (image, error, cacheType, url) in
				self?.profilePic.image = image?.circle //check ordering?
			})
		}).addDisposableTo(disposeBag)
		
		artTap = albumArt.rx.tap.map{ return self.curViewModel }
		profileTap = PublishSubject<UserViewModel>()
		
		profilePic.addTapRecognizer(sender: self, sel: #selector(FeedExpandedCell.profileTapped))
		username.addTapRecognizer(sender: self, sel: #selector(FeedExpandedCell.profileTapped))

	}
	
	func profileTapped(){
		profileTap.onNext(curViewModel.userViewModel) //is this unsafe?
	}
	
	
}
