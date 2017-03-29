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

class FeedViewController: MedleyBaseViewController {
	let disposeBag = DisposeBag()
	
	@IBOutlet var feedTableView: UITableView!
	
	lazy var viewModel: FeedViewModel = {
		return FeedViewModel(refreshOutlet: nil)
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//setup refresh outlet 
		feedTableView.estimatedRowHeight = 138
		feedTableView.rowHeight = UITableViewAutomaticDimension
		
		feedTableView.contentInset.top = UIApplication.shared.statusBarFrame.height
		setupRx()
	}
	
	func setupRx(){
		feedTableView.dataSource = nil
		feedTableView.delegate = nil
		viewModel
			.requestFeedPosts() //will this get new info/updates? what's pushing here?
			.bindTo(feedTableView.rx.items) { (tableView, row, element) in
				let indexPath = IndexPath(row: row, section: 0)
				
				let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.FeedCell.rawValue, for: indexPath) as! FeedCell
				cell.setPost(post: element)
				if(!cell.subscribed){ //maybe use Completed event to unsubscribe instead?
					cell.getArtTaps().subscribe(onNext: { post in
						super.showPostExplorer(post!)
					}).addDisposableTo(self.disposeBag)
					cell.getProfileTaps().subscribe(onNext: { user in
						super.showUserProfile(user)
					}).addDisposableTo(self.disposeBag)
					cell.subscribed = true
				}
				return cell
			}.addDisposableTo(disposeBag)
	}

}
