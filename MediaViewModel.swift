//
//  MediaViewModel.swift
//  
//
//  Created by Zack Rhodes on 2/6/17.
//
//

import Foundation

class MediaViewModel {
	
	var id: String?
	var user: User?
	var song: Song?
	
	init(song: Song){
		id = song.id //need?
		user = song.user //or should be passed in constructor? 
		song = song
	}
	
}
