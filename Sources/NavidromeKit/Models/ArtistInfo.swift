//
//  ArtistInfo.swift
//  NavidromeKit
//
//  Created by flowers on 2026-08-17.
//

import Foundation

public struct ArtistInfo: Codable, Hashable, Sendable {
	public let biography: String?
	public let musicBrainzID: String?
	public let lastFmURL: URL?
	public let smallImageURL: URL?
	public let mediumImageURL: URL?
	public let largeImageURL: URL?
	public let similarArtists: [SimilarArtist]?
	
	enum CodingKeys: String, CodingKey {
		case biography
		case musicBrainzID = "musicBrainzId"
		case lastFmURL = "lastFmUrl"
		case smallImageURL = "smallImageUrl"
		case mediumImageURL = "mediumImageUrl"
		case largeImageURL = "largeImageUrl"
		case similarArtists = "similarArtist"
	}
}

public struct SimilarArtist: Codable, Identifiable, Hashable, Sendable {
	public let id: String
	public let name: String
	public let coverArtID: String?
	public let artistImageURL: URL?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case coverArtID = "coverArt"
		case artistImageURL = "artistImageUrl"
	}
}
