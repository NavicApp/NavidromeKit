//
//  SortDescriptors.swift
//  NavidromeKit
//
//  Created by Lakhan Lothiyi on 18/08/2026.
//

public enum SortOrder {
	case ascending, descending

	internal var symbol: String {
		switch self {
		case .ascending: return "+"
		case .descending: return "-"
		}
	}
}

public protocol SortFieldRepresentable: Hashable {
	var rawValue: String { get }
}

public struct SortDescriptor<Field: SortFieldRepresentable> {
	public let field: Field
	public let order: SortOrder

	fileprivate init(_ field: Field, order: SortOrder = .descending) {
		self.field = field
		self.order = order
	}
}

public struct SortDescriptors<Field: SortFieldRepresentable>:
	ExpressibleByArrayLiteral
{
	private(set) var fields: [Field] = []
	private var orders: [Field: SortOrder] = [:]

	public init(arrayLiteral elements: SortDescriptor<Field>...) {
		for element in elements {
			if orders[element.field] == nil { fields.append(element.field) }
			orders[element.field] = element.order
		}
	}

	internal var queryValue: String {
		fields.map { "\(orders[$0]!.symbol)\($0.rawValue)" }.joined(
			separator: ","
		)
	}
}

// MARK: - Songs

public enum SongSortField: String, SortFieldRepresentable {
	case title, rating
}

public extension SortDescriptor where Field == SongSortField {
	static var title: Self { .init(.title) }
	static func title(order: SortOrder) -> Self { .init(.title, order: order) }

	static var rating: Self { .init(.rating) }
	static func rating(order: SortOrder) -> Self {
		.init(.rating, order: order)
	}
}

// MARK: - Artists

public enum ArtistSortField: String, SortFieldRepresentable {
	case name
}

public extension SortDescriptor where Field == ArtistSortField {
	static var name: Self { .init(.name) }
	static func name(order: SortOrder) -> Self { .init(.name, order: order) }
}

// MARK: - Albums

public enum AlbumSortField: String, SortFieldRepresentable {
	case name
}

public extension SortDescriptor where Field == AlbumSortField {
	static var name: Self { .init(.name) }
	static func name(order: SortOrder) -> Self { .init(.name, order: order) }
}

// MARK: - Users

public enum UserSortField: String, SortFieldRepresentable {
	case userName
}

public extension SortDescriptor where Field == UserSortField {
	static var userName: Self { .init(.userName) }
	static func userName(order: SortOrder) -> Self { .init(.userName, order: order) }
}

// MARK: - Shares

public enum ShareSortField: String, SortFieldRepresentable {
	case created
}

public extension SortDescriptor where Field == ShareSortField {
	static var created: Self { .init(.created) }
	static func created(order: SortOrder) -> Self { .init(.created, order: order) }
}


// MARK: - Playlists

public enum PlaylistSortField: String, SortFieldRepresentable {
	case name
}

public extension SortDescriptor where Field == PlaylistSortField {
	static var name: Self { .init(.name) }
	static func name(order: SortOrder) -> Self { .init(.name, order: order) }
}


// MARK: - Libraries

public enum LibrarySortField: String, SortFieldRepresentable {
	case created
}

public extension SortDescriptor where Field == LibrarySortField {
	static var created: Self { .init(.created) }
	static func created(order: SortOrder) -> Self { .init(.created, order: order) }
}
