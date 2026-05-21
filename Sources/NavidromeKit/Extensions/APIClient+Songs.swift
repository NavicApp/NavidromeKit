//
//  APIClient+Songs.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

import Foundation

public extension APIClient {
	/// Fetch songs, optionally with a criteria
	func getSongs(
		range: ClosedRange<Int>? = nil,
		sort: String? = nil,
		order: SortOrder = .descending,
		albumID: String? = nil,
		libraryID: String? = nil,
		albumArtistID: String? = nil,
		artistID: String? = nil,
		genreID: String? = nil,
		path: String? = nil,
		starred: Bool? = nil,
		year: Int? = nil,
		query: String? = nil
	) async throws -> [Song] {
		var queryItems = paginationQuery(range: range, sort: sort, order: order)
		
		if let albumID {
			queryItems.append(URLQueryItem(name: "album_id", value: albumID))
		}
		
		if let libraryID {
			queryItems.append(URLQueryItem(name: "library_id", value: libraryID))
		}
		
		if let albumArtistID {
			queryItems.append(URLQueryItem(name: "album_artist_id", value: albumArtistID))
		}
		
		if let artistID {
			queryItems.append(URLQueryItem(name: "artist_id", value: artistID))
		}
		
		if let genreID {
			queryItems.append(URLQueryItem(name: "genre_id", value: genreID))
		}
		
		if let path {
			queryItems.append(URLQueryItem(name: "path", value: path))
		}
		
		if let starred {
			queryItems.append(URLQueryItem(name: "starred", value: "\(starred)"))
		}
		
		if let year {
			queryItems.append(URLQueryItem(name: "year", value: "\(year)"))
		}
		
		if let query {
			queryItems.append(URLQueryItem(name: "title", value: query))
		}
		
		return try await get(path: "api/song", queryItems: queryItems)
	}
	
	/// Fetch songs for a given playlist
	func getSongs(
		playlistID: String,
		range: ClosedRange<Int>? = nil,
		sort: String? = nil,
		order: SortOrder = .descending
	) async throws -> [Song] {
		try await get(
			path: "api/playlist/\(playlistID)/tracks",
			queryItems: paginationQuery(range: range, sort: sort, order: order)
		)
	}
	
	/// Remove a list of song IDs from a playlist
	func deleteSongs(
		_ songIDs: [String],
		fromPlaylist playlistID: String
	) async throws {
		try await delete(
			path: "api/playlist/\(playlistID)/tracks",
			queryItems: songIDs.map({ URLQueryItem(name: "id", value: $0) })
		)
	}
	
	/// Add a list of song IDs to a playlist
	func addSongs(
		_ songIDs: [String],
		toPlaylist playlistID: String
	) async throws -> AddPlaylistSongsResponse {
		try await post(
			path: "api/playlist/\(playlistID)/tracks",
			body: AddPlaylistSongsPayload(songIDs: songIDs)
		)
	}
}
