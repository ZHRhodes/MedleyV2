//
//  PostPlayerProtocol.swift
//  Medley
//
//  Created by Zack Rhodes on 3/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

protocol PostPlayerProtocol {
	func setViewModel(newViewModel: MusicPostViewModel)
	func getArtTaps() -> Observable<Any?>
	func getPlayTaps() -> Observable<Bool>
}
