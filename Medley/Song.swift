//
//  Song.swift
//  Medley
//
//  Created by Zack Rhodes on 2/6/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

struct Song {
	var name: String?
	//var user: User?
	//type and caption?
	var artist: String?
	var album: String?
	var urlBig: URL?
	
	//picture urls? 
	
//	lazy var viewModel: MusicPostViewModel = {
//		return MusicPostViewModel(post: self)
//	}()
	
	init(name: String, artist: String, album: String, urlBig: String){
		self.name = name
		self.artist = artist
		self.album = album
		self.urlBig = URL(string: urlBig)
	}
	
}

extension Song: Equatable {}

func ==(lhs: Song, rhs: Song) -> Bool {
	return lhs.name == rhs.name &&
			lhs.artist == rhs.artist &&
			lhs.album == rhs.album
}
