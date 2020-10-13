//
//  CodableExtension.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

extension Encodable {
    func jsonEncodeToSnakeCase(keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .convertToSnakeCase) throws -> Any {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = keyEncodingStrategy
        let encoded = try encoder.encode(self)
        
        return try JSONSerialization.jsonObject(with: encoded, options: JSONSerialization.ReadingOptions.allowFragments)
    }
}
