//
//  SubsonicResponse.swift
//  NavidromeKit
//
//  Created by flowers on 2026-08-17.
//

import Foundation

public struct SubsonicResponse: Codable, Hashable, Sendable {
	public let body: SubsonicResponseBody
	
	enum CodingKeys: String, CodingKey {
		case body = "subsonic-response"
	}
}

public struct SubsonicResponseBody: Codable, Hashable, Sendable {
	public let artistInfo: ArtistInfo?
	
	public let openSubsonic: Bool
	public let serverVersion: String
	public let status: String
	public let type: String
	public let version: String
}
