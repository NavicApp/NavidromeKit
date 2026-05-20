//
//  TranscodingConfig.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

/// Navidrome transcoding configuration
public struct TranscodingConfig: Codable, Identifiable, Hashable, Sendable {
	public let id: String
	public let name: String
	public let targetFormat: String?
	public let command: String?
	public let defaultBitRate: Int?
}
