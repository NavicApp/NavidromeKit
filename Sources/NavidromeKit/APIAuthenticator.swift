//
//  APIAuthenticator.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

/// An authentication helper for Navidrome's API
public enum APIAuthenticator {
	/// Request a new session from the given server `URL`
	/// - Parameters:
	///   - instanceURL: The server `URL`
	///   - username: The username
	///   - password: The password
	///   - session: An optional `URLSession` to pass
	/// - Returns: An `AuthContext`, which could be stored in the keychain
    public static func createSession(
		instanceURL: URL,
		username: String,
		password: String,
		session: URLSession = .shared
	) async throws -> AuthContext {
		let loginURL = instanceURL.appendingPathComponent("auth/login")
		
		var request = URLRequest(url: loginURL)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let body = ["username": username, "password": password]
		request.httpBody = try JSONSerialization.data(withJSONObject: body)
		
		let (data, response) = try await session.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse else { throw APIError.invalidURL }
		if httpResponse.statusCode == 401 { throw APIError.unauthorized }
		guard httpResponse.statusCode == 200 else { throw APIError.serverError(httpResponse.statusCode) }
		
		return try JSONDecoder().decode(AuthContext.self, from: data)
    }
}
