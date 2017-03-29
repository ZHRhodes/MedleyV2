//
//  PostPlayerView.swift
//  Medley
//
//  Created by Zack Rhodes on 2/13/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

/* This is essentially an abstract parent class except it implements a few things common to both player types eg. material design shading. Unlike a protocol, this parent class can be used in the storyboard */

//declarations from extensions can't be overriden yet, so protocol is here rather than in extension
class PostPlayerView: UIView, PostPlayerProtocol {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		//fatalError("init(coder:) has not been implemented")
		super.init(coder: aDecoder)
		setupUI()
	}
	
	private func setupUI() {
		layer.masksToBounds = false
		layer.shadowOpacity = 0.4
		layer.shadowColor = UIColor.gray.cgColor
		layer.shadowRadius = 4.0
		layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
	}
	
	lazy var err: String = { return "PostPlayerView is a (semi abstract) base class that should never be invoked. Rather, big/small subclassed should be used." }()
	
	func setViewModel(newViewModel: MusicPostViewModel) {
		fatalError(err)
	}
	
	func getArtTaps() -> Observable<Any?> {
		//fatalError(err)
		print("thisi s running")
		return Observable<Any?>.empty()
	}
	
	func getPlayTaps() -> Observable<Bool> {
		fatalError(err)
	}
	
}

