//
//  FeedViewModel.swift
//  Medley
//
//  Created by Zack Rhodes on 2/13/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

class FeedViewModel: NSObject {
	
	let provider = MockDataProvider()
	let disposeBag = DisposeBag()
	
	var feedPosts = Variable(Array<MusicPost>()) //was private
	
	var updatedContent: Observable<Void> {
		return feedPosts
			.asObservable()
			.distinctUntilChanged{ $0 == $1 }
			.map{ $0.count > 0 }
	}
	
	//unused for now, but should bind to whatever is used to refresh feed
	var refreshOutlet: Observable<Void>?
	
	init(refreshOutlet: Observable<Void>?){
		self.refreshOutlet = refreshOutlet
		
		super.init()
		
		setup()
	}
	
	private func setup() {
		requestFeedPosts()
			.bindTo(feedPosts)
			.addDisposableTo(disposeBag)
	}
	
	func requestFeedPosts() -> Observable<[MusicPost]> { //was private
		return provider
			.getPosts()
			.toArray()
			.distinctUntilChanged{ $0 == $1 }
	}
}
