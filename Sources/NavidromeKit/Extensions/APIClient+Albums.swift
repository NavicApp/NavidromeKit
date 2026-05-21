//
//  APIClient+Albums.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

import Foundation

public extension APIClient {
	/// Fetch albums, optionally with a criteria
	func getAlbums(
		range: ClosedRange<Int>? = nil,
		sort: String? = "name",
		order: SortOrder = .descending,
		artistID: String? = nil,
		libraryID: String? = nil,
		starred: Bool? = nil,
		compilation: Bool? = nil,
		year: Int? = nil
	) async throws -> [Album] {
		var queryItems = paginationQuery(range: range, sort: sort, order: order)
		
		if let artistID {
			queryItems.append(URLQueryItem(name: "artist_id", value: artistID))
		}
		
		if let libraryID {
			queryItems.append(URLQueryItem(name: "library_id", value: libraryID))
		}
		
		if let starred {
			queryItems.append(URLQueryItem(name: "starred", value: "\(starred)"))
		}
		
		if let compilation {
			queryItems.append(URLQueryItem(name: "compilation", value: "\(compilation)"))
		}
		
		if let year {
			queryItems.append(URLQueryItem(name: "year", value: "\(year)"))
		}
		
		return try await get(path: "api/album", queryItems: queryItems)
	}
}
