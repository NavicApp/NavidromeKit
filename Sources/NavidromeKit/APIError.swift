//
//  APIError.swift
//  NavidromeKit
//
//  Created by flowers on 2026.05.07.
//

import Foundation

public enum APIError: Error, LocalizedError {
	case invalidURL
	case unauthorized
	case forbidden
	case serverError(Int)
	case decodingError(Error)
	case encodingError(Error)
	case requestFailed(Error)
	case subsonicError(SubsonicResponse)
	
	public var localizedDescription: String {
		switch self {
		case .invalidURL:					"An invalid URL was provided."
		case .unauthorized:					"Incorrect username or password."
		case .forbidden:					"Forbidden"
		case .serverError(let code):		"The server returned status code \(code)."
		case .decodingError(let error):		"Decoding error\n\n\(error)"
		case .encodingError(let error):		"Encoding error\n\n\(error)"
		case .requestFailed(let error):		error.localizedDescription
		case .subsonicError(let response):	"Subsonic error\n\n\(response)"
		}
	}
	
	public var errorDescription: String? { localizedDescription }
}
