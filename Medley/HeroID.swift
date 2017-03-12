//
//  HeroID.swift
//  Medley
//
//  Created by Zack Rhodes on 3/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

class HeroID {
	private let id = String(arc4random())
	lazy var song: String = {return self.id + "song"}()
	lazy var album: String = {return self.id + "album"}()
	lazy var artist: String = {return self.id + "artist"}()
	lazy var bg: String = {return self.id + "bg"}()
	lazy var username: String = {return self.id + "username"}()
	lazy var profilePic: String = {return self.id + "profilePic"}()
}
