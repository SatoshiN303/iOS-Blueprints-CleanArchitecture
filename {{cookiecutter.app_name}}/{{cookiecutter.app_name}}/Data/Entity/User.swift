//
//  User.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct User: Codable {
    public let login: String
    public let id: String?
    public let nodeId: String
    public let avatarUrl: URL
    public let gravatarId: String
    public let url: URL
    public let receivedEventsUrl: URL
    public let type: String

    public init(login: String,
                id: String,
                nodeId: String,
                avatarUrl: URL,
                gravatarId: String,
                url: URL,
                receivedEventsUrl: URL,
                type: String) {
        self.login = login
        self.id = id
        self.nodeId = nodeId
        self.avatarUrl = avatarUrl
        self.gravatarId = gravatarId
        self.url = url
        self.receivedEventsUrl = receivedEventsUrl
        self.type = type
    }
}

extension User {
    public init(from decoder: Decoder)  throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        login = try values.decodeWithString(forKey: .login)
        id = try values.decodeWithOptionalString(forKey: .id)
        nodeId = try values.decodeWithString(forKey: .nodeId)
        avatarUrl = try values.decode(URL.self, forKey: .avatarUrl)
        gravatarId = try values.decodeWithString(forKey: .gravatarId)
        url = try values.decode(URL.self, forKey: .url)
        receivedEventsUrl = try values.decode(URL.self, forKey: .receivedEventsUrl)
        type = try values.decodeWithString(forKey: .type)
    }
}
