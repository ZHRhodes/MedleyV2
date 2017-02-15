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
	func getArtTaps() -> Observable<MusicPostViewModel>
	func setViewModel(newViewModel: MusicPostViewModel)
}
