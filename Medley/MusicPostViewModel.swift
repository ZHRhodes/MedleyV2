//
//  MusicPostViewModel.swift
//  Medley
//
//  Created by Zack Rhodes on 2/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

class MusicPostViewModel {
	var musicPost: MusicPost!
	var userViewModel: UserViewModel!
	var song: Song {
		return musicPost.song
	}
	var postDate: Date? {
		return musicPost.postDate
	}
	var likes: Int? {
		return musicPost.likes
	}
	
	let heroID = HeroID()
	
	init(post: MusicPost){
		self.musicPost = post
		self.userViewModel = UserViewModel(user: post.user)
	}
	
	/*	quick hack for now
		likes probably doesn't need to be optional. otherwise this can be rewritten to be safer.
		Might break this out into comparison functions later (maybe used functional programming)
	*/
	func shouldExpandByLikes(param: Int)->Bool{
		return likes! > param
	}
	
	
}

extension MusicPostViewModel: Equatable {}

func ==(lhs: MusicPostViewModel, rhs: MusicPostViewModel) -> Bool {
	return lhs.musicPost == rhs.musicPost
}
