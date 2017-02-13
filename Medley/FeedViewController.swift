//
//  FeedViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 2/7/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class FeedViewController: UICollectionViewController {
	let disposeBag = DisposeBag()
	
	@IBOutlet var feedCollectionView: UICollectionView!
	
	lazy var viewModel: FeedViewModel = {
		return FeedViewModel(refreshOutlet: nil)
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//setup refresh outlet 
		
		setupRx()
	}
	
	func setupRx(){
		feedCollectionView.dataSource = nil
		feedCollectionView.delegate = nil
		viewModel
			.requestFeedPosts()
			.bindTo(feedCollectionView.rx.items) { (collectionView, row, element) in
				let indexPath = IndexPath(row: row, section: 0)
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collapsedCell", for: indexPath) as! FeedCollapsedCell
				cell.setViewModel(newViewModel: element.viewModel)
				return cell
			}
			.addDisposableTo(disposeBag)
	}
}
