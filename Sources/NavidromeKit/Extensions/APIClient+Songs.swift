//
//  APIClient+Songs.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

import Foundation

public extension APIClient {
	/// Fetch all songs from the library
	func fetchSongs(
		range: ClosedRange<Int>? = nil,
		sort: String? = nil,
		order: SortOrder = .descending
	) async throws -> [Song] {
		try await performRequest(
			path: "api/song",
			queryItems: paginationQuery(range: range, sort: sort, order: order)
		)
	}
	
	/// Fetch songs for an album
	func fetchSongs(
		albumID: String,
		range: ClosedRange<Int>? = nil,
		sort: String? = nil,
		order: SortOrder = .descending
	) async throws -> [Song] {
		try await performRequest(
			path: "api/song",
			queryItems: paginationQuery(range: range, sort: sort, order: order)
				+ [URLQueryItem(name: "album_id", value: albumID)]
		)
	}
	
	/// Fetch songs for a playlist
	func fetchSongs(
		playlistID: String,
		range: ClosedRange<Int>? = nil,
		sort: String? = nil,
		order: SortOrder = .descending
	) async throws -> [Song] {
		try await performRequest(
			path: "api/playlist/\(playlistID)/tracks",
			queryItems: paginationQuery(range: range, sort: sort, order: order)
		)
	}
}
