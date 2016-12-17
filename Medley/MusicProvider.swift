//
//  MusicProvider.swift
//  Medley
//
//  Created by Zack Rhodes on 12/16/16.
//  Copyright © 2016 zhrhodes. All rights reserved.
//

import Foundation

protocol MusicProvider {
	func search(byTitle title: String)
}
