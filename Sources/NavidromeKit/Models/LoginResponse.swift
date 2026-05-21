//
//  LoginResponse.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-20.
//

/// Response from `/auth/login`.
/// 
/// You most likely want to use `Session` instead as it wraps
/// this response with additional useful fields, such as `instanceURL`
public struct LoginResponse: Codable, Hashable, Sendable {
	public let token: String
	public let id: String
	public let isAdmin: Bool
	public let lastFMApiKey: String?
	public let name: String
	public let subsonicSalt: String
	public let subsonicToken: String
	public let username: String
}
