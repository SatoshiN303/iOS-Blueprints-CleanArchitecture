//
//  AccessToken.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct AccessToken: Codable {
    public let accessToken: String
    public let tokenType: String
    public let scope: String

    public init(accessToken: String, tokenType: String, scope: String) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.scope = scope
    }
}

extension AccessToken {
    public init(from decoder: Decoder)  throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decodeWithString(forKey: .accessToken)
        tokenType = try values.decodeWithString(forKey: .tokenType)
        scope = try values.decodeWithString(forKey: .scope)
    }
}
