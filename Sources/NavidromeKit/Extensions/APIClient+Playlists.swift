//
//  APIClient+Playlists.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

public extension APIClient {
	/// Fetch all playlists from the library
	func fetchPlaylists(
		range: ClosedRange<Int>? = nil,
		sort: String? = "name",
		order: SortOrder = .descending
	) async throws -> [Playlist] {
		try await performRequest(path: "api/playlist", queryItems: paginationQuery(range: range, sort: sort, order: order))
	}
}
