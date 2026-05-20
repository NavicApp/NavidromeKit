//
//  APIClient+Albums.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

public extension APIClient {
	/// Fetch all albums from the library
	func fetchAlbums(
		range: ClosedRange<Int>? = nil,
		sort: String? = "name",
		order: SortOrder = .descending
	) async throws -> [Album] {
		try await performRequest(path: "api/album", queryItems: paginationQuery(range: range, sort: sort, order: order))
	}
}
