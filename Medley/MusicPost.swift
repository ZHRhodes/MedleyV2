//
//  MusicPost.swift
//  Medley
//
//  Created by Zack Rhodes on 2/6/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

struct MusicPost {
	var user: User?
	var song: Song?
	var postDate: Date?

	var viewModel: MusicPostViewModel!
//	lazy var viewModel: MusicPostViewModel = {
//		return MusicPostViewModel(post: self)
//	}()

	init(user: User, song: Song, postDate: Date) {
		self.user = user
		self.song = song
		self.postDate = postDate
		viewModel = MusicPostViewModel(post: self)
	}
}

extension MusicPost: Equatable {}

func ==(lhs: MusicPost, rhs: MusicPost) -> Bool {
	return lhs.user == rhs.user &&
		lhs.song == rhs.song
}
