//
//  SearchRepositryRequest.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import APIKit
import Foundation

struct SearchRepositryRequest: GETRequest {
    typealias Response = ItemsResponse<Repository>
    typealias Parameter = SearchRepositoriesParameters
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/search/repositories"
    }
    
    var parameters: Any?
    
    init(parameter: Parameter) {
        parameters = try? parameter.jsonEncodeToSnakeCase()
    }
}
