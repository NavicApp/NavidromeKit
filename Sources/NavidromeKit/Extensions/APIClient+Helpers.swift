//
//  APIClient+Helpers.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

import Foundation

internal extension APIClient {
	func performRequest<T: Decodable>(
		path: String,
		method: String = "GET",
		queryItems: [URLQueryItem] = []
	) async throws -> T {
		var components = URLComponents(url: instanceURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
		if !queryItems.isEmpty {
			components?.queryItems = queryItems
		}
		
		guard let url = components?.url else { throw APIError.invalidURL }
		
		var request = URLRequest(url: url)
		request.httpMethod = method
		request.setValue("Bearer \(authContext.token)", forHTTPHeaderField: "X-ND-Authorization")
		
		do {
			let (data, response) = try await session.data(for: request)
			guard let httpResponse = response as? HTTPURLResponse else { throw APIError.invalidURL }
			
			if httpResponse.statusCode == 401 { throw APIError.unauthorized }
			guard (200...299).contains(httpResponse.statusCode) else {
				throw APIError.serverError(httpResponse.statusCode)
			}
			
			return try decoder.decode(T.self, from: data)
		} catch let error as DecodingError {
			throw APIError.decodingError(error)
		} catch {
			throw APIError.requestFailed(error)
		}
	}
	
	func paginationQuery(range: ClosedRange<Int>?, sort: String?, order: SortOrder) -> [URLQueryItem] {
		var items = [
			URLQueryItem(name: "_sort", value: sort),
			URLQueryItem(name: "_order", value: order.rawValue)
		]
		if let range = range {
			items.append(URLQueryItem(name: "_start", value: "\(range.lowerBound)"))
			items.append(URLQueryItem(name: "_end", value: "\(range.upperBound)"))
		}
		return items
	}
	
	func buildSubsonicParams() -> [URLQueryItem] {
		[
			URLQueryItem(name: "u", value: authContext.username),
			URLQueryItem(name: "s", value: authContext.subsonicSalt),
			URLQueryItem(name: "t", value: authContext.subsonicToken),
			URLQueryItem(name: "f", value: "json"),
			URLQueryItem(name: "v", value: "1.16.1"),
			URLQueryItem(name: "c", value: "NavidromeKit")
		]
	}
}
