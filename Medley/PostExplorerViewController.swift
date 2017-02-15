//
//  PostExplorerViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 2/14/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit
import Hero

class PostExplorerViewController: UIViewController {
	var post: MusicPostViewModel!
	
	@IBOutlet var postPlayerView: PostPlayerView!
	@IBOutlet var albumArt: UIImageView!
	@IBOutlet var songName: UILabel!
	@IBOutlet var artistName: UILabel!
	
	override func viewDidLoad() {
		albumArt.sd_setImage(with: post.song?.urlBig)
		songName.text = post.song?.name
		artistName.text = post.song?.artist
		
		albumArt.heroID = post.heroID
		songName.heroID = post.heroID + "song"
		artistName.heroID = post.heroID + "artist"
		postPlayerView.heroID = post.heroID + "bg"
	}
	
	func set(post: MusicPostViewModel){
		self.post = post
	}
}
