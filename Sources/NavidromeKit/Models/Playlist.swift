//
//  Playlist.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

/// Navidrome playlist
public struct Playlist: Codable, Identifiable, Hashable, Sendable {
	public let id: String
	public let name: String
	public let comment: String?
	public let duration: Double?
	public let size: Int?
	public let songCount: Int?
	public let ownerName: String?
	public let ownerID: String?
	public let isPublic: Bool?
	public let path: String?
	public let sync: Bool?
	public let uploadedImage: String?
	public let createdAt: Date?
	public let updatedAt: Date?
	public let evaluatedAt: Date?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case comment
		case duration
		case size
		case songCount
		case ownerName
		case ownerID = "ownerId"
		case isPublic = "public"
		case path
		case sync
		case uploadedImage
		case createdAt
		case updatedAt
		case evaluatedAt
	}
}
