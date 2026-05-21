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
		let authContext = try await APIAuthenticator.createSession(
			instanceURL: URL(string: "https://demo.navidrome.org/")!,
			username: "demo",
			password: "demo"
		)
		self.client = APIClient(authContext: authContext)
	}
	
	@Test
	func getThingsViaID() async throws {
		let playlist = try await client.getPlaylists(range: 0...1)[0]
		let song = try await client.getSongs(range: 0...1)[0]
		let artist = try await client.getArtists(range: 0...1)[0]
		let album = try await client.getAlbums(range: 0...1)[0]
		let share = try await client.getShares(range: 0...1)[0]
		_ = try await client.getPlaylist(id: playlist.id)
		_ = try await client.getSong(id: song.id)
		_ = try await client.getArtist(id: artist.id)
		_ = try await client.getAlbum(id: album.id)
		_ = try await client.getShare(id: share.id)
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
