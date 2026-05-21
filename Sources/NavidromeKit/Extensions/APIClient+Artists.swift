//
//  APIClient+Artists.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-20.
//

import Foundation

public extension APIClient {
	/// Fetch artists, optionally with a criteria
	func getArtists(
		range: ClosedRange<Int>? = nil,
		sort: String? = "name",
		order: SortOrder = .descending,
		libraryID: String? = nil,
		starred: Bool? = nil,
		role: String? = nil, // TODO: role enum
		query: String? = nil
	) async throws -> [Artist] {
		var queryItems = paginationQuery(range: range, sort: sort, order: order)
		
		if let libraryID {
			queryItems.append(URLQueryItem(name: "library_id", value: libraryID))
		}
		
		if let starred {
			queryItems.append(URLQueryItem(name: "starred", value: "\(starred)"))
		}
		
		if let role {
			queryItems.append(URLQueryItem(name: "role", value: role))
		}
		
		if let query {
			queryItems.append(URLQueryItem(name: "name", value: query))
		}
		
		return try await get(path: "api/artist", queryItems: queryItems)
	}
	
	/// Fetch an artist by their ID
	func getArtist(id: String) async throws -> Artist {
		try await get(path: "api/artist/\(id)")
	}
}
