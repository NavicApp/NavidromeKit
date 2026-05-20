//
//  Artist.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

/// Navidrome artist
public struct Artist: Codable, Identifiable, Hashable, Sendable {
	public let playCount: Int?
	public let playDate: Date?
	public let rating: Int?
	public let ratedAt: Date?
	public let starredAt: Date?
	public let averageRating: Int?
	public let id: String
	public let name: String
	public let orderArtistName: String
	public let size: Int
	public let albumCount: Int
	public let songCount: Int
	public let smallImageURL: String?
	public let mediumImageURL: String?
	public let largeImageURL: String?
	public let externalInfoUpdatedAt: Date
	public let isMissing: Bool
	public let createdAt: Date
	public let updatedAt: Date
	public let starred: Bool?
	public let biography: String?
	public let sortArtistName: String?
	public let mbzArtistID: String?
	public let externalURL: String?
	
	enum CodingKeys: String, CodingKey {
		case playCount
		case playDate
		case rating
		case ratedAt
		case starredAt
		case averageRating
		case id
		case name
		case orderArtistName
		case size
		case albumCount
		case songCount
		case smallImageURL = "smallImageUrl"
		case mediumImageURL = "mediumImageUrl"
		case largeImageURL = "largeImageUrl"
		case externalInfoUpdatedAt
		case isMissing = "missing"
		case createdAt
		case updatedAt
		case starred
		case biography
		case sortArtistName
		case mbzArtistID = "mbzArtistId"
		case externalURL = "externalUrl"
	}
}
