//
//  DataProvider.swift
//  Medley
//
//  Created by Zack Rhodes on 2/13/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

protocol DataProvider {
	func getPosts() -> Observable<MusicPost>
}
