//
//  APIClient+Shares.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-20.
//

public extension APIClient {
	/// Fetch shares
	func getShares(
		range: ClosedRange<Int>? = nil,
		sort: String? = "created",
		order: SortOrder = .descending
	) async throws -> [Share] {
		try await get(path: "api/share", queryItems: paginationQuery(range: range, sort: sort, order: order))
	}
	
	/// Fetch a share by its ID
	func getShare(id: String) async throws -> Share {
		try await get(path: "api/share/\(id)")
	}
	
	/// Delete a share by its ID
	func deleteShare(id: String) async throws {
		try await delete(path: "api/share/\(id)")
	}
	
	/// Create a share
	func createShare(
		description: String = "",
		resourceIDs: [String],
		downloadable: Bool = false,
		resourceType: ResourceType = .album
	) async throws -> CreateShareResponse {
		try await post(path: "api/share", body: CreateSharePayload(
			description: description,
			resourceIDs: resourceIDs,
			downloadable: downloadable,
			resourceType: resourceType
		))
	}
	
	/// Update an existing share by its ID
	func updateShare(
		id: String,
		downloadable: Bool? = nil,
		expiresAt: String? = nil,
		description: String? = nil
	) async throws -> UpdateShareResponse {
		try await put(path: "api/share/\(id)", body: UpdateSharePayload(
			id: id,
			downloadable: downloadable,
			expiresAt: expiresAt,
			description: description
		))
	}
}
