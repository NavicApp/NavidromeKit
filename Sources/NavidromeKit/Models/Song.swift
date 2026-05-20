//
//  Song.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

/// Navidrome song
public struct Song: Codable, Identifiable, Hashable, Sendable {
	public let playCount: Int?
	public let playDate: Date?
	public let rating: Int?
	public let ratedAt: Date?
	public let starredAt: Date?
	public let averageRating: Int?
	public let bookmarkPosition: Int
	public let id: String
	public let libraryID: Int
	public let libraryPath: String
	public let libraryName: String
	public let folderID: String
	public let path: String
	public let title: String
	public let album: String
	public let artistID: String
	public let artist: String
	public let albumArtistID: String
	public let albumArtist: String
	public let albumID: String
	public let hasCoverArt: Bool
	public let trackNumber: Int
	public let discNumber: Int
	public let year: Int
	public let date: String?
	public let originalYear: Int
	public let releaseYear: Int
	public let size: Int
	public let suffix: String
	public let duration: Double
	public let bitRate: Int
	public let sampleRate: Int
	public let bitDepth: Int
	public let channels: Int
	public let codec: String
	public let genre: String
	public let orderTitle: String
	public let orderAlbumName: String
	public let orderArtistName: String
	public let orderAlbumArtistName: String
	public let compilation: Bool
	public let comment: String?
	public let lyrics: String
	public let explicitStatus: String
	public let rgAlbumGain: Double?
	public let rgAlbumPeak: Double?
	public let rgTrackGain: Double?
	public let rgTrackPeak: Double?
	public let tags: [String: [String]]?
	public let missing: Bool
	public let birthTime: String
	public let createdAt: Date
	public let updatedAt: Date
	public let starred: Bool?
	public let genres: [Genre]?
	public let bpm: Int?
	public let originalDate: String?
	public let sortArtistName: String?
	public let sortAlbumArtistName: String?
	public let catalogNum: String?
	public let mbzRecordingID: String?
	public let mbzReleaseTrackID: String?
	public let mbzAlbumID: String?
	public let mbzReleaseGroupID: String?
	
	enum CodingKeys: String, CodingKey {
		case playCount
		case playDate
		case rating
		case ratedAt
		case starredAt
		case averageRating
		case bookmarkPosition
		case id
		case libraryID = "libraryId"
		case libraryPath
		case libraryName
		case folderID = "folderId"
		case path
		case title
		case album
		case artistID = "artistId"
		case artist
		case albumArtistID = "albumArtistId"
		case albumArtist
		case albumID = "albumId"
		case hasCoverArt
		case trackNumber
		case discNumber
		case year
		case date
		case originalYear
		case releaseYear
		case size
		case suffix
		case duration
		case bitRate
		case sampleRate
		case bitDepth
		case channels
		case codec
		case genre
		case orderTitle
		case orderAlbumName
		case orderArtistName
		case orderAlbumArtistName
		case compilation
		case comment
		case lyrics
		case explicitStatus
		case rgAlbumGain
		case rgAlbumPeak
		case rgTrackGain
		case rgTrackPeak
		case tags
		case missing
		case birthTime
		case createdAt
		case updatedAt
		case starred
		case genres
		case bpm
		case originalDate
		case sortArtistName
		case sortAlbumArtistName
		case catalogNum
		case mbzRecordingID = "mbzRecordingId"
		case mbzReleaseTrackID = "mbzReleaseTrackId"
		case mbzAlbumID = "mbzAlbumId"
		case mbzReleaseGroupID = "mbzReleaseGroupId"
	}
}
