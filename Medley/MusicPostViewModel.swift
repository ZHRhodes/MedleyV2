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
	var likes: Int?
	
	let heroID = String(arc4random())
	
	init(post: MusicPost){
		self.user = post.user
		self.song = post.song
		self.postDate = post.postDate
		self.likes = post.likes
	}
	
	/*	quick hack for now
		likes probably doesn't need to be optional. otherwise this can be rewritten to be safer.
		Might break this out into comparison functions later (maybe used functional programming)
	*/
	func shouldExpandByLikes(param: Int)->Bool{
		return likes! > param
	}
}
