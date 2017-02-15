//
//  UIKit+Medley.swift
//  Medley
//
//  Created by Zack Rhodes on 2/14/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
	func viewController(forStoryboardName: String) -> UIViewController {
		return UIStoryboard(name: forStoryboardName, bundle: nil).instantiateInitialViewController()!
	}
}
