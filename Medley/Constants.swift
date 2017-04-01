//
//  Constants.swift
//  Medley
//
//  Created by Zack Rhodes on 3/11/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

struct Constants{
	enum CellIdentifiers: String {
		case FeedCollapsedCell = "feedCollapsedCell"
		case FeedExpandedCell = "feedExpandedCell"
	}
	
	struct StoryboardIDs {
		static let PostExplorer = "PostExplorer"
		static let UserProfile = "UserProfile"
	}
	
	struct Assets {
		static let playButton = "play_button.png"
		static let pauseButton = "pause_button.png"
	}
}
