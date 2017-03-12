//
//  PostExplorerViewModel.swift
//  Medley
//
//  Created by Zack Rhodes on 3/11/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

class PostExplorerViewModel: NSObject {
	
	//this might need the full post, not just the view model 
	
	private var post: Variable<MusicPostViewModel>!
	
	init(_ postViewModel: MusicPostViewModel){
		post = Variable(postViewModel)
	}
	
	func getPost() -> Variable<MusicPostViewModel> {
		return post
	}
	
}
