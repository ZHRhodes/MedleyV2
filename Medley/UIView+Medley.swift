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

	//class func fromNib<T : UIView>() -> T {
	//	return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
	//}

}

protocol UIViewLoading {}
extension UIView : UIViewLoading {}

extension UIViewLoading where Self : UIView {
	
	// note that this method returns an instance of type `Self`, rather than UIView
	static func loadFromNib() -> Self {
		let nibName = "\(self)".characters.split{$0 == "."}.map(String.init).last!
		let nib = UINib(nibName: nibName, bundle: nil)
		return nib.instantiate(withOwner: self, options: nil).first as! Self
	}
	
}
