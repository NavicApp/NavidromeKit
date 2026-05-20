//
//  Player.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

/// Navidrome player
public struct Player: Codable {
	public let userName: String
	public let id: String
	public let name: String
	public let userAgent: String
	public let userID: String
	public let client: String
	public let ip: String
	public let lastSeen: Date
	public let transcodingID: String
	public let maxBitRate: Int
	public let reportRealPath: Bool
	public let scrobbleEnabled: Bool
	
	enum CodingKeys: String, CodingKey {
		case userName
		case id
		case name
		case userAgent
		case userID = "userId"
		case client
		case ip
		case lastSeen
		case transcodingID = "transcodingId"
		case maxBitRate
		case reportRealPath
		case scrobbleEnabled
	}
}
