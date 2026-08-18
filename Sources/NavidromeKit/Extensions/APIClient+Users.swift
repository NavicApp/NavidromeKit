//
//  APIClient+Users.swift
//  NavidromeKit
//
//  Created by flowers on 2026-08-17.
//

public extension APIClient {
	/// Fetch users
	func getUsers(
		range: ClosedRange<Int>? = nil,
		sort: String? = "userName",
		order: SortOrder = .ascending
	) async throws -> [User] {
		try await get(path: "api/user", queryItems: paginationQuery(range: range, sort: sort, order: order))
	}
	
	/// Fetch a user by their ID
	func getUser(id: String) async throws -> User {
		try await get(path: "api/user/\(id)")
	}
	
	/// Delete a user by their ID
	func deleteUser(id: String) async throws {
		try await delete(path: "api/user/\(id)")
	}
	
	/// Create a user
	func createUser(
		userName: String,
		name: String,
		email: String? = nil,
		password: String,
		libraries: [Library]?,
		isAdmin: Bool = false
	) async throws -> CreateShareResponse {
		try await post(path: "api/user", body: CreateUserPayload(
			userName: userName,
			name: name,
			email: email,
			password: password,
			libraries: libraries,
			isAdmin: isAdmin
		))
	}
	
	/// Update an existing user by their ID
	func updateUser(
		id: String,
		userName: String? = nil,
		name: String? = nil,
		email: String? = nil,
		isAdmin: Bool? = nil,
		libraries: [Library]? = nil
	) async throws -> UpdateShareResponse {
		try await put(path: "api/user/\(id)", body: UpdateUserPayload(
			id: id,
			userName: userName,
			name: name,
			email: email,
			isAdmin: isAdmin,
			libraries: libraries
		))
	}
}
