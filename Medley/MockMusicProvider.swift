//
//  MockMusicProvider.swift
//  Medley
//
//  Created by Zack Rhodes on 2/6/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation
import RxSwift

class MockMusicProvider: MusicProvider {
	
	func search(byTitle title: String) -> Observable<Song>{
		return getMockSongs()
	}
	
	func getMockSongs() -> Observable<Song> {
		return Observable.from(MockMusicProvider.mockSongs)
	}
		
	static let mockSongs = [
		Song(name: "Congratulations", artist: "MGMT", album: "Congratulations", urlBig: "https://images.genius.com/293b9f11b3fa5b9368df724f66098aa6.1000x1000x1.jpg"),
		Song(name: "Love on the Weekend", artist: "John Mayer", album: "The Search for Everything", urlBig: "http://images.complex.com/complex/images/c_limit,w_680/f_auto,fl_lossy,pg_1,q_auto/zwg4urtgqqm4gfnr27gz/john-mayer-wave-one"),
		Song(name: "Oslo", artist: "Anna Of The North", album: "Oslo", urlBig: "http://direct.rhapsody.com/imageserver/images/Alb.247739384/500x500.jpg"),
		Song(name: "Alabama", artist: "Night Moves", album: "Pennied Days", urlBig: "http://static1.squarespace.com/static/56760d19d82d5eb8ca9a1d83/t/569d3d9d4bf118627e7e27bd/1478189997979/"),
		Song(name: "15 Step", artist: "Radiohead", album: "In Rainbows", urlBig: "https://wordsformusic.files.wordpress.com/2014/02/in-rainbows.jpg"),
		Song(name: "8(circle)", artist: "Bon Iver", album: "22, A Million", urlBig: "http://images.genius.com/592617e90a52c31a1e815e4b7fb37891.1000x1000x1.jpg"),
		Song(name: "Glider", artist: "Tycho", album: "Epoch", urlBig: "https://i1.sndcdn.com/artworks-000185909660-1wcfde-t500x500.jpg"),
		Song(name: "See Her Out(Thats Just Life)", artist: "Francis and the Lights", album: "Farewell, Starlite!", urlBig: "http://static1.squarespace.com/static/55914c0de4b0a919cf59e119/56b12bb337013bf29023c4db/581915ad2994ca082116718c/1478039057120/Francis-and-the-Lights-See-Her-Out-2016.jpg?format=1000w"),
		Song(name: "Candyland - feat. Jonsi", artist: "Sin Fang", album: "Spaceland", urlBig: "http://static.stereogum.com/uploads/2016/07/Sin-Fang-Spaceland.jpeg"),
		Song(name: "Current Carry", artist: "Vetiver", album: "Complete Strangers", urlBig: "http://static.stereogum.com/uploads/2015/02/es009_vetiver-completestrangers.jpg"),
		Song(name: "Miasma Sky", artist: "Baths", album: "Obsidian", urlBig: "http://a4.files.prettymuchamazing.com/image/upload/c_fit,cs_srgb,dpr_1.0,h_1200,q_80,w_1200/MTMwMTYwNTI2NjAzOTA3MDQy.jpg")
		]
	
	
	
}
