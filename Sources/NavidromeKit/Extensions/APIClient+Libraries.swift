//
//  APIClient+Libraries.swift
//  NavidromeKit
//
//  Created by flowers on 2026-08-17.
//

import Foundation

public extension APIClient {
	/// Fetch libraries
	func getLibraries(
		range: ClosedRange<Int>? = nil,
		sort: String? = "created",
		order: SortOrder = .descending,
		query: String? = nil
	) async throws -> [Library] {
		var queryItems = paginationQuery(range: range, sort: sort, order: order)
		
		if let query {
			queryItems.append(URLQueryItem(name: "name", value: query))
		}
		
		return try await get(path: "api/library", queryItems: queryItems)
	}
	
	/// Fetch a library by its ID
	func getLibrary(id: Int) async throws -> Library {
		try await get(path: "api/library/\(id)")
	}
	
	/// Delete a library by its ID
	func deleteLibrary(id: Int) async throws {
		try await delete(path: "api/library/\(id)")
	}
	
	/// Create a library
	func createLibrary(
		name: String,
		path: String
	) async throws -> CreateLibraryResponse {
		try await post(path: "api/library", body: CreateLibraryPayload(
			name: name,
			path: path
		))
	}
	
	/// Update an existing library by its ID
	func updateLibrary(
		id: Int,
		name: String? = nil,
		path: String? = nil,
		defaultNewUsers: Bool? = nil
	) async throws -> UpdateShareResponse {
		try await put(path: "api/library/\(id)", body: UpdateLibraryPayload(
			id: id,
			name: name,
			path: path,
			defaultNewUsers: defaultNewUsers
		))
	}
}
