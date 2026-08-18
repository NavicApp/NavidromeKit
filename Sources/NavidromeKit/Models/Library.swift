//
//  Library.swift
//  NavidromeKit
//
//  Created by flowers on 2026-08-17.
//

import Foundation

public struct Library: Codable {
	public let id: Int
	public let name: String
	public let path: String
	public let remotePath: String?
	public let lastScanAt: Date?
	public let lastScanStartedAt: Date?
	public let fullScanInProgress: Bool
	public let updatedAt: Date?
	public let createdAt: Date
	public let totalSongs: Int?
	public let totalAlbums: Int?
	public let totalArtists: Int?
	public let totalFolders: Int?
	public let totalFiles: Int?
	public let totalMissingFiles: Int?
	public let totalSize: Int?
	public let totalDuration: Int?
	public let defaultNewUsers: Bool
}
