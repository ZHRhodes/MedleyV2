//
//  UserViewModel.swift
//  Medley
//
//  Created by Zack Rhodes on 2/6/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

class UserViewModel: NSObject {
	var user: User!
	var username: String? {
		return user.username
	}
	var id: String? {
		return user.id
	}
	var profilePicture: URL? {
		return user.profilePicture
	}
	var followers: Int? {
		return user.followers
	}
	var following: Int? {
		return user.following
	}
	var jams: Int? {
		return user.jams
	}
	
	let heroID = HeroID()
	
	init(user: User) {
		self.user = user
	}
}
