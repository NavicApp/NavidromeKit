//
//  User.swift
//  NavidromeKit
//
//  Created by flowers on 2026-08-17.
//

import Foundation

public struct User: Codable {
	public let id: String
	public let userName: String
	public let name: String
	public let email: String?
	public let isAdmin: Bool
	public let lastLoginAt: Date?
	public let lastAccessAt: Date?
	public let createdAt: Date
	public let updatedAt: Date?
	public let libraries: [Library]
}

public struct CreateUserPayload: Codable {
	public let userName: String
	public let name: String
	public let email: String?
	public let password: String
	public let libraries: [Library]?
	public let isAdmin: Bool
}

public struct UpdateUserPayload: Codable {
	public let id: String
	public let userName: String?
	public let name: String?
	public let email: String?
	public let isAdmin: Bool?
	public let libraries: [Library]?
}
