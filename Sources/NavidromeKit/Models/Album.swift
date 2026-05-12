//
//  Album.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.06.
//

import Foundation

/// Navidrome album
public struct Album: Codable, Identifiable, Hashable, Sendable {
	public let playCount: Int?
	public let playDate: Date?
	public let rating: Int?
	public let ratedAt: Date?
	public let starredAt: Date?
	public let averageRating: Int?
	public let id: String
	public let libraryID: Int
	public let libraryPath: String
	public let libraryName: String
	public let name: String
	public let albumArtistID: String
	public let albumArtist: String
	public let maxYear: Int
	public let minYear: Int
	public let date: String?
	public let maxOriginalYear: Int
	public let minOriginalYear: Int
	public let compilation: Bool
	public let comment: String?
	public let songCount: Int
	public let duration: Double
	public let size: Int
	public let discs: [String: String]
	public let orderAlbumName: String
	public let orderAlbumArtistName: String
	public let explicitStatus: String
	public let externalInfoUpdatedAt: Date?
	public let genre: String
	public let genres: [Genre]?
	public let tags: [String: [String]]?
	//public let participants: Participants
	public let missing: Bool
	public let importedAt: Date
	public let createdAt: Date
	public let updatedAt: Date
	public let starred: Bool?
	public let originalDate: String?
	public let sortAlbumArtistName: String?
	public let catalogNum: String?
	public let mbzAlbumID: String?
	public let mbzReleaseGroupID: String?
	
	enum CodingKeys: String, CodingKey {
		case playCount
		case playDate
		case rating
		case ratedAt
		case starredAt
		case averageRating
		case id
		case libraryID = "libraryId"
		case libraryPath
		case libraryName
		case name
		case albumArtistID = "albumArtistId"
		case albumArtist
		case maxYear
		case minYear
		case date
		case maxOriginalYear
		case minOriginalYear
		case compilation
		case comment
		case songCount
		case duration
		case size
		case discs
		case orderAlbumName
		case orderAlbumArtistName
		case explicitStatus
		case externalInfoUpdatedAt
		case genre
		case genres
		case tags
		case missing
		case importedAt
		case createdAt
		case updatedAt
		case starred
		case originalDate
		case sortAlbumArtistName
		case catalogNum
		case mbzAlbumID = "mbzAlbumId"
		case mbzReleaseGroupID = "mbzReleaseGroupId"
	}
}
