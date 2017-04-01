//
//  PlayPauseButton.swift
//  Medley
//
//  Created by Zack Rhodes on 3/28/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit


class PlayPauseButton: UIButton {

	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.setImage(UIImage(named: Constants.Assets.playButton)!, for: .normal)
		self.setImage(UIImage(named: Constants.Assets.pauseButton)!, for: .selected)
	
	}
	
	func tap() {
		isSelected = !isSelected
	}
}
