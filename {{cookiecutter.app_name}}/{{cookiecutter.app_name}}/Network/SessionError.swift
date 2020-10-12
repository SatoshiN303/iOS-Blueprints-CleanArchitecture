//
//  SessionError.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public enum SessionError: Error {
    case noData(HTTPURLResponse)
    case unacceptableStatusCode(Int, Message?)
}

extension SessionError {
    public struct Message: Decodable {
        public let documentationURL: URL
        public let message: String

        private enum CodingKeys: String, CodingKey {
            case documentationURL = "documentation_url"
            case message
        }
    }
}
