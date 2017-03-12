//
//  UIView+Medley.swift
//  Medley
//
//  Created by Zack Rhodes on 3/12/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	func addTapRecognizer(sender: Any?, sel: Selector){
		self.isUserInteractionEnabled = true
		let gr = UITapGestureRecognizer(target: sender, action: sel)
		self.addGestureRecognizer(gr)
	}
}
