//
//  FeedCell.swift
//  Medley
//
//  Created by Zack Rhodes on 2/13/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

protocol FeedCell {
	var subscribed: Bool { get set } //maybe not ideal but works
	func getArtTaps() -> Observable<MusicPostViewModel>
	func getProfileTaps() -> Observable<User>
	func setViewModel(newViewModel: MusicPostViewModel)
}
