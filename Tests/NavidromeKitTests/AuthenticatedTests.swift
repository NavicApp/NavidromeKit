//
//  AuthenticatedTests.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-20.
//

import Foundation
import Testing
@testable import NavidromeKit

@Suite
struct AuthenticatedTests {
	let client: APIClient
	
	init() async throws {
		let instanceURL = URL(string: "https://demo.navidrome.org/")!
		
		let authContext = try await APIAuthenticator.createSession(
			instanceURL: instanceURL,
			username: "demo",
			password: "demo"
		)
		
		self.client = APIClient(instanceURL: instanceURL, authContext: authContext)
	}
	
	@Test
	func modifyPlaylist() async throws {
		let playlist = try await client.getPlaylists(range: 0...1)[0]
		let song = try await client.getSongs(range: 0...1)[0]
		let response = try await client.addSongs([song.id], toPlaylist: playlist.id)
		#expect(response.added == 1)
		try await client.deleteSongs([song.id], fromPlaylist: playlist.id)
	}
}
