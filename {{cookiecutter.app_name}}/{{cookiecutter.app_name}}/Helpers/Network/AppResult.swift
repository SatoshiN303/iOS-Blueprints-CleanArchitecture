//
//  AppResult.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

public enum AppResult<T> {
    case success(_ value: T)
    case error(_ error: Error)
    
    @discardableResult
    func ifSuccess(_ f: (T) -> Void) -> AppResult {
        if case let .success(value) = self {
            f(value)
        }
        return self
    }
    
    @discardableResult
    func ifError(_ f: (Error) -> Void) -> AppResult {
        if case let .error(error) = self {
            f(error)
        }
        return self
    }
}
