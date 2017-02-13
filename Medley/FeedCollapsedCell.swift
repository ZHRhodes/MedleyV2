//
//  FeedCollapsedCell.swift
//  Medley
//
//  Created by Zack Rhodes on 2/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

class FeedCollapsedCell: UICollectionViewCell {
	
	var viewModel = PublishSubject<MusicPostViewModel>()
	
	func setViewModel(newViewModel: MusicPostViewModel){
		self.viewModel.onNext(newViewModel)
	}
	
	@IBOutlet var profilePic: UIImageView!
	@IBOutlet var username: UILabel!
	@IBOutlet var timeSincePost: UILabel!
	@IBOutlet var albumArt: UIImageView!
	
	@IBOutlet var songName: UILabel!
	@IBOutlet var artist: UILabel!
	
	let disposeBag = DisposeBag()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	
	private func setup() {
		viewModel.subscribe(onNext: { [weak self] viewModel in
			self?.username.text = viewModel.user?.username
			self?.songName.text = viewModel.song?.name
			self?.artist.text = viewModel.song?.album
		}).addDisposableTo(disposeBag)
	}
	
	
	
}
