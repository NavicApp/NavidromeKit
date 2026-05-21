//
//  AuthContext.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.06.
//

import Foundation

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
	
	public let password: String
	public let instanceURL: URL
	
	init(loginResponse: LoginResponse, password: String, instanceURL: URL) {
		self.token = loginResponse.token
		self.id = loginResponse.id
		self.isAdmin = loginResponse.isAdmin
		self.lastFMApiKey = loginResponse.lastFMApiKey
		self.name = loginResponse.name
		self.subsonicSalt = loginResponse.subsonicSalt
		self.subsonicToken = loginResponse.subsonicToken
		self.username = loginResponse.username
		self.password = password
		self.instanceURL = instanceURL
	}
}
