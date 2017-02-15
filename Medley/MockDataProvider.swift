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
				MusicPost(user: _user, song: _song, postDate: Date(), likes: Int(arc4random()) % 30)
			}
			.observeOn(MainScheduler.instance)
	}
	
	func getUsers() -> Observable<User> {
		return Observable.from(MockDataProvider.mockUsers)
	}
	
	static let mockUsers = [
		User(id: "1", username: "zhrhodes", fullName: "Zack Rhodes", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/67071_659454267432902_1768518118_n.jpg?oh=62fa922dd0cc9478b4fa9790605f1a16&oe=594C415D"),
		User(id: "2", username: "kmarie", fullName: "Kady Barnfield", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/15747401_10211418053911729_5038586281178181462_n.jpg?oh=a38e3af5b5714415612b6b41bf1f3ed4&oe=5908E543"),
		User(id: "3", username: "awmaes", fullName: "Adam Maes", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/11159467_10152976915643515_1162535710845898891_n.jpg?oh=ef48ae8230efd5eeaed19b1513054cc3&oe=5937E537"),
		User(id: "4", username: "nwrhodes", fullName: "Nick Rhodes", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/13007082_10205940924033410_1229757592364468031_n.jpg?oh=5ea39ca1ee01d7334d3f7e2abcddfd38&oe=59071CAB"),
		User(id: "5", username: "kbaecker", fullName: "Kevin Baecker", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/15541207_10154828264778205_4045373917424107725_n.jpg?oh=29f4f8e9d50fe62b76b043c10a6f2bbb&oe=59410B83"),
		User(id: "6", username: "chaga", fullName: "Chaga Jayasuriya", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/1625675_10152230319685132_1154928091_n.jpg?oh=45e31184e6d0b5a46db6c1267b76dcc7&oe=5905F032"),
		User(id: "7", username: "jameso", fullName: "James Ostlund", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/396550_274458372618030_180089429_n.jpg?oh=09d9f019a1abab43b9915716fde999ab&oe=594A5481"),
		User(id: "8", username: "oOzer", fullName: "Omer Ozer", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/11159467_10152976915643515_1162535710845898891_n.jpg?oh=ef48ae8230efd5eeaed19b1513054cc3&oe=5937E537"),
		User(id: "9", username: "kFarmhouse", fullName: "Kaylee Farmer", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/15220161_10209208097452208_752336249454803004_n.jpg?oh=2a8f8ad6176cf50e3241c045f7a1ae30&oe=593C302F"),
		User(id: "10", username: "seanlang", fullName: "Sean Lang", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/16002879_1620503484643480_3685922143528248025_n.jpg?oh=5b46a7318fc68cf52e41286115b04256&oe=5936D5F0"),
		User(id: "11", username: "mitch", fullName: "Mitch Shipton", profilePicture: "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/396550_274458372618030_180089429_n.jpg?oh=09d9f019a1abab43b9915716fde999ab&oe=594A5481")
	]
	
}
