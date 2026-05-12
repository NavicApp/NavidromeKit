//
//  AuthContext.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.06.
//

/// Navidrome authentication context
public struct AuthContext: Codable, Hashable, Sendable {
	public let token: String
	public let id: String
	public let isAdmin: Bool
	public let lastFMApiKey: String?
	public let name: String
	public let subsonicSalt: String
	public let subsonicToken: String
	public let username: String
}
