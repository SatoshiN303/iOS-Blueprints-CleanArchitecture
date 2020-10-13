//
//  Fetchable.swift
//  {{cookiecutter.app_name}}
//
//  Created by 佐藤 慎 on 2020/10/13.
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import APIKit

protocol Fetchable {
    func fetch<T: Request>(request: T, completion: @escaping (AppResult<T.Response>) -> Void)
}

extension Fetchable {
    func fetch<T>(request: T, completion: @escaping (AppResult<T.Response>) -> Void) where T: Request {
        Session.send(request, callbackQueue: nil) { result in
            switch result {
            case let .success(value):
                completion(.success(value))
            case let .failure(error):
                completion(.error(error))
            }
        }
    }
}
