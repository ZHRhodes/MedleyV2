//
//  PostExplorerViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 2/14/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit
import Hero
import RxSwift

class PostExplorerViewController: UIViewController {

	var viewModel: PostExplorerViewModel!
	
	let disposeBag = DisposeBag()
	
	@IBOutlet var postPlayerView: PostPlayerView!
	@IBOutlet var albumArt: UIImageView!
	@IBOutlet var songName: UILabel!
	@IBOutlet var artistName: UILabel!
	
	func set(viewModel: PostExplorerViewModel){
		self.viewModel = viewModel
	}
	
	override func viewDidLoad() {
		setupRx()
		setupSwipes()
	}
	
	private func setupRx(){
		viewModel.getPost().asObservable().subscribe(onNext: { [weak self] post in
			self?.albumArt.sd_setImage(with: post.song?.urlBig)
			self?.songName.text = post.song?.name
			self?.artistName.text = post.song?.artist
			
			self?.albumArt.heroID = post.heroID.album
			self?.songName.heroID = post.heroID.song
			self?.artistName.heroID = post.heroID.artist
			self?.postPlayerView.heroID = post.heroID.bg
		}).addDisposableTo(disposeBag)
	}
	
	private func setupSwipes(){
		let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(PostExplorerViewController.handleSwipes(sender:)))
		downSwipe.direction = .down
		view.addGestureRecognizer(downSwipe)
	}
	
	func handleSwipes(sender:UISwipeGestureRecognizer){
		hero_unwindToRootViewController()
	}
	
}
