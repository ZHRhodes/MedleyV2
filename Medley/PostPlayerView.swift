//
//  PostPlayerView.swift
//  Medley
//
//  Created by Zack Rhodes on 2/13/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit

class PostPlayerView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		//fatalError("init(coder:) has not been implemented")
		super.init(coder: aDecoder)
		setup()
		
	}
	
	private func setup() {
		layer.masksToBounds = false
		layer.shadowOpacity = 0.4
		layer.shadowColor = UIColor.gray.cgColor
		layer.shadowRadius = 4.0
		layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
	}
	
	

}
