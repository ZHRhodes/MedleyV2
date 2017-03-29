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
	
	private var user: Variable<User>!
	private var userViewModel: Variable<UserViewModel>!
	
	init(_ user: User){
		self.user = Variable(user)
		self.userViewModel = Variable(self.user.value.viewModel)
	}
	
	func getUserViewModel() -> Variable<UserViewModel> {
		return userViewModel
	}
	
}
