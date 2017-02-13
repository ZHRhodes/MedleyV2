//
//  UserViewModel.swift
//  Medley
//
//  Created by Zack Rhodes on 2/6/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

class UserViewModel: NSObject {
	var username: String?
	var id: String?
	var profilePictureURL: URL?
	
	init(user: User) {
		username = user.username
		id = user.id
		profilePictureURL = user.profilePicture
	}
}
