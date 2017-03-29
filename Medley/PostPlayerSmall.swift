//
//  PostPlayerSmall.swift
//  Medley
//
//  Created by Zack Rhodes on 3/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class PostPlayerSmall: PostPlayerView {
	
	@IBOutlet var albumArt: UIButton!
	@IBOutlet var songName: UILabel!
	@IBOutlet var artistName: UILabel!
	@IBOutlet var playButton: UIButton!
	
	let disposeBag = DisposeBag()
	
	var viewModel = PublishSubject<MusicPostViewModel>()
	
	var curViewModel: MusicPostViewModel!
	
	override func setViewModel(newViewModel: MusicPostViewModel){
		self.viewModel.onNext(newViewModel)
	}
	
	private var artTaps: PublishSubject<Any?>!
	
	override func getArtTaps() -> Observable<Any?> {
		print("now this is happening")
		return artTaps
	}
	
	private var playTaps: PublishSubject<Bool>!
	
	override func getPlayTaps() -> Observable<Bool> {
		return playTaps
	}
	
	override init(frame: CGRect){
		super.init(frame: frame)
		setupRx()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupRx()
	}
	
	func setupRx(){
		artTaps = PublishSubject<Any?>()
		playTaps = PublishSubject<Bool>()
		
		viewModel.subscribe(onNext: { [weak self] viewModel in
			self?.albumArt.heroID = viewModel.heroID.album
			self?.songName.heroID = viewModel.heroID.song
			self?.artistName.heroID = viewModel.heroID.artist
			
			self?.curViewModel = viewModel
			self?.songName.text = viewModel.song?.name
			self?.artistName.text = viewModel.song?.artist
			self?.albumArt.sd_setBackgroundImage(with: viewModel.song?.urlBig, for: .normal)
		}).addDisposableTo(disposeBag)
	}
	
	@IBAction func playButtonTapped(_ sender: Any) {
		playButton.isSelected = !playButton.isSelected
		playTaps.onNext(playButton.isSelected)
		if(playButton.isSelected){
			print("playing")
		}else{
			print("pausing")
		}
	}
	
	@IBAction func albumArtTapped(_ sender: Any) {
		artTaps.onNext(nil) //!
	}
	
}
