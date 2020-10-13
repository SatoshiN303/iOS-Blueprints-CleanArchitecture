//
//  SearchRepositoriesParameters.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct SearchRepositoriesParameters: Codable {
    public let q: String
    public let page: String?
    public let perPage: String?
    public let sort: Sort?
    public let order: Order?
    
    public init(query: String, page: String?, perPage: String?, sort: Sort?, order: Order?) {
        self.q = query
        self.page = page
        self.perPage = perPage
        self.sort = sort
        self.order = order
    }
}

extension SearchRepositoriesParameters {
    public enum Sort: String, Codable {
        case stars
        case forks
        case updated
    }

    public enum Order: String, Codable {
        case asc
        case desc
    }
}
