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
	
	public let instanceURL: URL
	internal let authContext: AuthContext
	internal let session: URLSession
	
	internal let decoder: JSONDecoder = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .formatted(dateFormatter)
		return decoder
	}()
	
	/// Instantiate a client given an `AuthContext` and instance `URL`
	/// - Parameters:
	///   - instanceURL: The same instance `URL` that was used for creating the `AuthContext`.
	///   - authContext: Authentication context, created via `APIAuthenticator.createSession`
	///   - session: An optional `URLSession` to pass
	public init(
		instanceURL: URL,
		authContext: AuthContext,
		session: URLSession = {
			let configuration = URLSessionConfiguration.default
			configuration.waitsForConnectivity = true
			let session = URLSession(configuration: configuration)
			return session
		}()
	) {
		self.instanceURL = instanceURL
		self.authContext = authContext
		self.session = session
	}
}
