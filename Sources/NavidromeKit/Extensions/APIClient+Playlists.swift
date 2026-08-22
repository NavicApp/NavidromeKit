//
//  APIClient+Playlists.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

import Foundation

public extension APIClient {
	/// Fetch playlists, optionally with a criteria
	func getPlaylists(
		range: ClosedRange<Int>? = nil,
		sort: SortDescriptors<PlaylistSortField>? = [.name],
		query: String? = nil,
		ownerID: String? = nil,
		smart: Bool? = nil
	) async throws -> [Playlist] {
		var queryItems = paginationQuery(range: range, sort: sort)
		
		if let query {
			queryItems.append(URLQueryItem(name: "q", value: query))
		}
		
		if let ownerID {
			queryItems.append(URLQueryItem(name: "owner_id", value: ownerID))
		}
		
		if let smart {
			queryItems.append(URLQueryItem(name: "smart", value: "\(smart)"))
		}
		
		return try await get(path: "api/playlist", queryItems: queryItems)
	}
	
	/// Fetch a playlist by its ID
	func getPlaylist(id: String) async throws -> Playlist {
		try await get(path: "api/playlist/\(id)")
	}
	
	/// Create a new playlist
	func createPlaylist(
		name: String,
		comment: String? = nil,
		isPublic: Bool = true
	) async throws -> CreatePlaylistResponse {
		try await post(path: "api/playlist", body: CreatePlaylistPayload(
			name: name,
			comment: comment,
			isPublic: isPublic
		))
	}
	
	/// Update an existing playlist
	func updatePlaylist(
		id: String,
		name: String? = nil,
		comment: String? = nil,
		ownerID: String? = nil,
		isPublic: Bool? = nil
	) async throws -> UpdatePlaylistResponse {
		try await put(path: "api/playlist/\(id)", body: UpdatePlaylistPayload(
			id: id,
			name: name,
			comment: comment,
			ownerID: ownerID,
			isPublic: isPublic
		))
	}
	
	/// Delete an existing playlist
	func deletePlaylist(id: String) async throws {
		try await delete(path: "api/playlist/\(id)")
	}
}
