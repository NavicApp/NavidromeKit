//
//  APIClient.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.06.
//

import Foundation

/// Class to interact with Navidrome's API
public final class APIClient: Sendable {
	@MainActor public static var shared: APIClient?
	
	internal let apiSession: APISession
	internal let urlSession: URLSession
	
	internal let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .custom({ decoder in
			let container = try decoder.singleValueContainer()
			let dateString = try container.decode(String.self)
			let formatter = ISO8601DateFormatter()
			formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
			return formatter.date(from: dateString)!
		})
		return decoder
	}()
	
	internal let encoder: JSONEncoder = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
		let encoder = JSONEncoder()
		encoder.dateEncodingStrategy = .formatted(dateFormatter)
		return encoder
	}()
	
	/// Instantiate a client given an `APISession` and instance `URL`
	/// - Parameters:
	///   - apiSession: API session, created via `APIAuthenticator.createSession`
	///   - session: An optional `URLSession` to pass
	public init(
		apiSession: APISession,
		urlSession: URLSession = {
			let configuration = URLSessionConfiguration.default
			configuration.waitsForConnectivity = true
			let session = URLSession(configuration: configuration)
			return session
		}()
	) {
		self.apiSession = apiSession
		self.urlSession = urlSession
	}
}
