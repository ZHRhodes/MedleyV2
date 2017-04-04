//
//  SpotifyTestViewController.swift
//  Medley
//
//  Created by Zack Rhodes on 4/1/17.
//  Copyright © 2017 zhrhodes. All rights reserved.
//

import Foundation

class SpotifyTestViewController: UIViewController {
	
	var auth = SPTAuth.defaultInstance()!
	var session:SPTSession!
	var player: SPTAudioStreamingController?
	var loginUrl: URL?
	
	@IBOutlet var loginButton: UIButton!
	
	override func viewDidLoad() {
		setup()
		NotificationCenter.default.addObserver(self, selector: #selector(SpotifyTestViewController.updateAfterFirstLogin), name: Notification.Name("loginSuccessful"), object: nil)
	}
	
	func setup(){
		SPTAuth.defaultInstance().clientID = "e19925bc72994858b583ef17766d052b"
		SPTAuth.defaultInstance().redirectURL = URL(string: "medleylogin://spotifycallback/")
		SPTAuth.defaultInstance().requestedScopes = [SPTAuthStreamingScope, SPTAuthPlaylistReadPrivateScope, SPTAuthPlaylistModifyPublicScope, SPTAuthPlaylistModifyPrivateScope]
		loginUrl = SPTAuth.defaultInstance().spotifyAppAuthenticationURL()
	}
	
	func updateAfterFirstLogin(){
		if let sessionObj:AnyObject = UserDefaults.standard.object(forKey: "SpotifySession") as AnyObject? {
			let sessionDataObj = sessionObj as! Data
			
			let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
			
			self.session = firstTimeSession
			
			initializePlayer(authSession: session)
		}
	}
	
	func initializePlayer(authSession: SPTSession){
		if self.player == nil {
			self.player = SPTAudioStreamingController.sharedInstance()
			self.player!.playbackDelegate = self
			self.player!.delegate = self
			try! player!.start(withClientId: auth.clientID)
			self.player!.login(withAccessToken: authSession.accessToken)
		}
	}
	
	@IBAction func loginButtonTap(_ sender: Any) {
		if(UIApplication.shared.openURL(loginUrl!)){
			if(auth.canHandle(auth.redirectURL)){
				//build in error handling
			}
		}
	}
}

extension SpotifyTestViewController: SPTAudioStreamingPlaybackDelegate, SPTAudioStreamingDelegate {
	func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController!) {
		print("logged in to audio controller")
		
		self.player?.playSpotifyURI("spotify:track:2CI8kpdHTWLPcHLk3shPHP", startingWith: 0, startingWithPosition: 0, callback: { (error) in
			if(error != nil){
				print("playing!")
			}
		})
	}
}
