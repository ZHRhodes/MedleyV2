//
//  MockDataProvider.swift
//  Medley
//
//  Created by Zack Rhodes on 2/6/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

class MockDataProvider: DataProvider {
	
	func getPosts() -> Observable<MusicPost> {
		return Observable
			.zip(getUsers(), MockMusicProvider().getMockSongs()) { (_user, _song) in
				MusicPost(user: _user, song: _song, postDate: Date())
			}
			.observeOn(MainScheduler.instance)
	}
	
	func getUsers() -> Observable<User> {
		return Observable.from(MockDataProvider.mockUsers)
	}
	
	static let mockUsers = [
		User(id: "1", username: "zhrhodes", fullName: "Zack Rhodes", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "2", username: "kmarie", fullName: "Kady Barnfield", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "3", username: "awmaes", fullName: "Adam Maes", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "4", username: "nwrhodes", fullName: "Nick Rhodes", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "5", username: "kbaecker", fullName: "Kevin Baecker", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "6", username: "chaga", fullName: "Chaga Jayasuriya", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "7", username: "jameso", fullName: "James Ostlund", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "8", username: "oOzer", fullName: "Omer Ozer", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "9", username: "kFarmerhouse", fullName: "Kaylee Farmer", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "10", username: "seanlang", fullName: "Sean Lang", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		User(id: "11", username: "mitch", fullName: "Mitch Shipton", profilePicture: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg")
	]
	
}
