//
//  Share.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

/// Navidrome share
public struct Share: Codable, Identifiable, Hashable, Sendable {
	public let id: String
	public let userID: String
	public let username: String
	public let downloadable: Bool
	public let expiresAt: String
	public let lastVisitedAt: String?
	public let resourceID: String
	public let resourceType: ResourceType
	public let contents: String
	public let format: String?
	public let maxBitRate: Int?
	public let visitCount: Int?
	public let createdAt: Date
	public let updatedAt: Date
	public let description: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case userID = "userId"
		case username
		case downloadable
		case expiresAt
		case lastVisitedAt
		case resourceID = "resourceIds"
		case resourceType
		case contents
		case format
		case maxBitRate
		case visitCount
		case createdAt
		case updatedAt
		case description
	}
}

public struct CreateSharePayload: Codable, Hashable, Sendable {
	public let description: String
	public let resourceID: String
	public let downloadable: Bool
	public let resourceType: ResourceType
	
	enum CodingKeys: String, CodingKey {
		case description
		case resourceID = "resourceIds"
		case downloadable
		case resourceType
	}
}

public struct CreateShareResponse: Codable, Identifiable, Hashable, Sendable {
	public let id: String
}

public struct UpdateSharePayload: Codable, Identifiable, Hashable, Sendable {
	public let id: String
	public let downloadable: Bool?
	public let expiresAt: String?
	public let description: String?
}

public typealias UpdateShareResponse = Share
