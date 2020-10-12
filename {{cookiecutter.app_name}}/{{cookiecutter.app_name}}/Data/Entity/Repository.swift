//
//  Repository.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public struct Repository: Codable {
    public let id: Int?
    public let nodeId: String
    public let name: String
    public let fullName: String
    public let owner: User
    public let `private`: Bool
    public let htmlUrl: URL
    public let contributorsUrl: URL
    public let description: String?
    public let fork: Bool
    public let url: URL
    public let createdAt: String
    public let updatedAt: String
    public let pushedAt: String?
    public let homepage: String?
    public let size: Int
    public let stargazersCount: Int
    public let watchersCount: Int
    public let language: String?
    public let forksCount: Int
    public let openIssuesCount: Int
    public let defaultBranch: String

    public init(id: Int?,
                nodeId: String,
                name: String,
                fullName: String,
                owner: User,
                private: Bool,
                htmlUrl: URL,
                contributorsUrl: URL,
                description: String?,
                fork: Bool,
                url: URL,
                createdAt: String,
                updatedAt: String,
                pushedAt: String?,
                homepage: String?,
                size: Int,
                stargazersCount: Int,
                watchersCount: Int,
                language: String?,
                forksCount: Int,
                openIssuesCount: Int,
                defaultBranch: String) {
        self.id = id
        self.nodeId = nodeId
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.private = `private`
        self.htmlUrl = htmlUrl
        self.contributorsUrl = contributorsUrl
        self.description = description
        self.fork = fork
        self.url = url
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pushedAt = pushedAt
        self.homepage = homepage
        self.size = size
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.language = language
        self.forksCount = forksCount
        self.openIssuesCount = openIssuesCount
        self.defaultBranch = defaultBranch
    }
}

extension Repository {
    public init(from decoder: Decoder)  throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeWithOptionalInt(forKey: .id)
        nodeId = try values.decodeWithString(forKey: .nodeId)
        name = try values.decodeWithString(forKey: .name)
        fullName = try values.decodeWithString(forKey: .fullName)
        owner = try values.decode(User.self, forKey: .owner)
        `private` = try values.decode(Bool.self, forKey: .private)
        htmlUrl = try values.decode(URL.self, forKey: .htmlUrl)
        contributorsUrl = try values.decode(URL.self, forKey: .contributorsUrl)
        description = try? values.decodeWithOptionalString(forKey: .description)
        fork = try values.decode(Bool.self, forKey: .fork)
        url = try values.decode(URL.self, forKey: .url)
        createdAt = try values.decodeWithString(forKey: .createdAt)
        updatedAt = try values.decodeWithString(forKey: .updatedAt)
        pushedAt = try values.decodeWithString(forKey: .pushedAt)
        homepage = try? values.decodeWithOptionalString(forKey: .homepage)
        size = try values.decodeWithInt(forKey: .size)
        stargazersCount = try values.decodeWithInt(forKey: .stargazersCount)
        watchersCount = try values.decodeWithInt(forKey: .watchersCount)
        language = try? values.decodeWithOptionalString(forKey: .language)
        forksCount = try values.decodeWithInt(forKey: .forksCount)
        openIssuesCount = try values.decodeWithInt(forKey: .openIssuesCount)
        defaultBranch = try values.decodeWithString(forKey: .defaultBranch)
     }
 }
