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

class FeedViewController: UITableViewController {
	let disposeBag = DisposeBag()
	
	@IBOutlet var feedTableView: UITableView!
	
	lazy var viewModel: FeedViewModel = {
		return FeedViewModel(refreshOutlet: nil)
	}()
	
	//var artTaps = ObserverType()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//setup refresh outlet 
		tableView.estimatedRowHeight = 138
		tableView.rowHeight = UITableViewAutomaticDimension
		
		tableView.contentInset.top = UIApplication.shared.statusBarFrame.height
		setupRx()
	}
	
	private func showPostExplorer(post: MusicPostViewModel){
		print("showing post: \(post.song)")
		let storyboardName = "PostExplorer"
		let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()! as! PostExplorerViewController
		vc.set(post: post)
		self.present(vc, animated: true, completion: nil)
	}
	
	func setupRx(){
		feedTableView.dataSource = nil
		feedTableView.delegate = nil
		viewModel
			.requestFeedPosts() //will this get new info/updates? what's pushing here?
			.bindTo(feedTableView.rx.items) { (tableView, row, element) in
				let indexPath = IndexPath(row: row, section: 0)
				let cell: FeedCell!
				let expand = element.viewModel.shouldExpandByLikes(param: 20)
				cell = expand ? tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.FeedExpandedCell.rawValue, for: indexPath) as! FeedExpandedCell : tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.FeedCollapsedCell.rawValue, for: indexPath) as! FeedCollapsedCell
				cell.setViewModel(newViewModel: element.viewModel)
				if(!cell.subscribed){
					cell.getArtTaps().subscribe(onNext: { [weak self] post in
						self?.showPostExplorer(post: post)
					}).addDisposableTo(self.disposeBag)
					cell.getProfileTaps().subscribe(onNext: { [weak self] user in
						print(user.username ?? "no username")
					}).addDisposableTo(self.disposeBag)
					cell.subscribed = true
				}
				return expand ? cell as! FeedExpandedCell : cell as! FeedCollapsedCell
			}
			.addDisposableTo(disposeBag)
	}

}
