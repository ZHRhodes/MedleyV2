//
//  MusicPostViewModel.swift
//  Medley
//
//  Created by Zack Rhodes on 2/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

class MusicPostViewModel {
	var user: User?
	var song: Song?
	var postDate: Date?
	
	init(post: MusicPost){
		self.user = post.user
		self.song = post.song
		self.postDate = post.postDate
	}
}
