//
//  UserProfileViewModel.swift
//  Medley
//
//  Created by Zack Rhodes on 3/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

class UserProfileViewModel {
	
	private var userViewModel: Variable<UserViewModel>!
	
	init(_ user: UserViewModel){
		self.userViewModel = Variable(user)
	}
	
	func getUserViewModel() -> Variable<UserViewModel> {
		return userViewModel
	}
	
}
