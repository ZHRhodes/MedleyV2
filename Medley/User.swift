//
//  User.swift
//  Medley
//
//  Created by Zack Rhodes on 2/6/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

struct User {
	var id: String?
	var username: String?
	var fullName: String?
	var profilePicture: URL?
	
	lazy var viewModel: UserViewModel = {
		return UserViewModel(user: self)
	}()
	
	init(id: String, username: String, fullName: String, profilePicture: String){
		self.id = id
		self.username = username
		self.fullName = fullName
		self.profilePicture = URL(string: profilePicture)
	}
}

extension User: Equatable {}

func ==(lhs: User, rhs: User) -> Bool {
	return lhs.id == rhs.id &&
			lhs.username == rhs.username &&
			lhs.fullName == rhs.fullName &&
			lhs.profilePicture == rhs.profilePicture
}
