//
//  APIClient+CoverArt.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

import Foundation

public extension APIClient {
	func getCoverArtURL(id: String, size: Int = 512) -> URL? {
		var components = URLComponents(url: instanceURL.appendingPathComponent("rest/getCoverArt"), resolvingAgainstBaseURL: false)
		var query = buildSubsonicParams()
		query.append(URLQueryItem(name: "id", value: id))
		query.append(URLQueryItem(name: "size", value: "\(size)"))
		components?.queryItems = query
		return components?.url
	}
}
