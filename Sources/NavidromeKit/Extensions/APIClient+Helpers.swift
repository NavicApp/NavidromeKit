//
//  APIClient+Helpers.swift
//  NavidromeKit
//
//  Created by flowers on 2026-05-12.
//

import Foundation

// MARK: - private helpers for building requests
internal extension APIClient {
	/// Build a URL for a request
	private func buildRequestURL(
		path: String,
		queryItems: [URLQueryItem] = []
	) throws -> URL {
		var components = URLComponents(url: apiSession.instanceURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
		
		if !queryItems.isEmpty {
			components?.queryItems = queryItems
		}
		
		guard let url = components?.url else { throw APIError.invalidURL }
		return url
	}
	
	/// Build a request without a body
	private func buildRequest(
		path: String,
		method: String,
		queryItems: [URLQueryItem] = []
	) throws -> URLRequest {
		let url = try buildRequestURL(path: path, queryItems: queryItems)
		
		var request = URLRequest(url: url)
		request.httpMethod = method
		request.setValue("Bearer \(apiSession.token)", forHTTPHeaderField: "X-ND-Authorization")
		
		return request
	}
	
	/// Build a request with a body
	private func buildRequest<B: Encodable>(
		path: String,
		method: String,
		body: B,
		queryItems: [URLQueryItem] = []
	) throws -> URLRequest {
		let url = try buildRequestURL(path: path, queryItems: queryItems)
		
		var request = URLRequest(url: url)
		request.httpMethod = method
		request.setValue("Bearer \(apiSession.token)", forHTTPHeaderField: "X-ND-Authorization")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		do {
			request.httpBody = try encoder.encode(body)
		} catch let error as EncodingError {
			throw APIError.encodingError(error)
		}
		
		return request
	}
	
	/// Fetch raw data for a request
	private func fetchData(
		for request: URLRequest
	) async throws -> Data {
		let data: Data
		let response: URLResponse
		
		do {
			(data, response) = try await urlSession.data(for: request)
		} catch {
			throw APIError.requestFailed(error)
		}
		
		guard let httpResponse = response as? HTTPURLResponse else { throw APIError.invalidURL }
		
		if httpResponse.statusCode == 401 { throw APIError.unauthorized }
		guard (200...299).contains(httpResponse.statusCode) else {
			throw APIError.serverError(httpResponse.statusCode)
		}
		
		return data
	}
	
	/// Fetch decoded data for a request
	private func fetchResponse<T: Decodable>(
		for request: URLRequest
	) async throws -> T {
		do {
			let data = try await fetchData(for: request)
			return try decoder.decode(T.self, from: data)
		} catch let error as DecodingError {
			throw APIError.decodingError(error)
		} catch {
			throw error
		}
	}
}

// MARK: - internal helpers for performing requests
internal extension APIClient {
	func get<T: Decodable>(
		path: String,
		queryItems: [URLQueryItem] = []
	) async throws -> T {
		let request = try buildRequest(path: path, method: "GET", queryItems: queryItems)
		return try await fetchResponse(for: request)
	}
	
	func put<T: Decodable, B: Encodable>(
		path: String,
		body: B,
		queryItems: [URLQueryItem] = []
	) async throws -> T {
		let request = try buildRequest(path: path, method: "PUT", body: body, queryItems: queryItems)
		return try await fetchResponse(for: request)
	}
	
	func post<T: Decodable, B: Encodable>(
		path: String,
		body: B,
		queryItems: [URLQueryItem] = []
	) async throws -> T {
		let request = try buildRequest(path: path, method: "POST", body: body, queryItems: queryItems)
		return try await fetchResponse(for: request)
	}
	
	func delete(
		path: String,
		queryItems: [URLQueryItem] = []
	) async throws {
		let request = try buildRequest(path: path, method: "DELETE", queryItems: queryItems)
		_ = try await fetchData(for: request)
	}
}

// MARK: - internal query helpers
internal extension APIClient {
	func paginationQuery(range: ClosedRange<Int>?, sort: String?, order: SortOrder) -> [URLQueryItem] {
		var items = [
			URLQueryItem(name: "_sort", value: sort),
			URLQueryItem(name: "_order", value: order.rawValue)
		]
		if let range {
			items.append(URLQueryItem(name: "_start", value: "\(range.lowerBound)"))
			items.append(URLQueryItem(name: "_end", value: "\(range.upperBound)"))
		}
		return items
	}
	
	func buildSubsonicParams() -> [URLQueryItem] {
		[
			URLQueryItem(name: "u", value: apiSession.username),
			URLQueryItem(name: "s", value: apiSession.subsonicSalt),
			URLQueryItem(name: "t", value: apiSession.subsonicToken),
			URLQueryItem(name: "f", value: "json"),
			URLQueryItem(name: "v", value: "1.16.1"),
			URLQueryItem(name: "c", value: "NavidromeKit")
		]
	}
}
