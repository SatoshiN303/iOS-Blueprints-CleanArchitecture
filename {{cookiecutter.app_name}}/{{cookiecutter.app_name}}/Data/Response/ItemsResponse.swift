//
//  ItemsResponse.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct ItemsResponse<Item: Codable>: Codable {
    public let totalCount: Int
    public let incompleteResults: Bool
    public let items: [Item]

    public init(totalCount: Int, incompleteResults: Bool, items: [Item]) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}

extension ItemsResponse {
    public init(from decoder: Decoder)  throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try values.decode(Int.self, forKey: .totalCount)
        incompleteResults = try values.decode(Bool.self, forKey: .incompleteResults)
        items = try values.decode([Item].self, forKey: .items)
    }
}
