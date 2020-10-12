//
//  RequestExtension.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import APIKit

typealias GETRequest = Request & OptionalDecodable & ParameterInit

// MARK: - protocol

protocol OptionalDecodable {
    var optionalDecodingKey: JSONDecoder.KeyDecodingStrategy? { get }
}

protocol ParameterInit {
    associatedtype Parameter
    init(parameter: Parameter)
}

// MARK: - extension

extension OptionalDecodable {
    var optionalDecodingKey: JSONDecoder.KeyDecodingStrategy? {
        return .convertFromSnakeCase
    }
}

extension Request where Response: Codable, Self: OptionalDecodable {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError()
        }
        return url
    }
    
    var dataParser: DataParser {
        return DecodableDataParser() as DataParser
    }
    
    var queryParameters: [String: Any]? {
        if method == .post {
            return nil
        }
        guard let json = parameters as? [String: Any] else { return nil }
        return FormURLEncodedBodyParameters(formObject: json).form
    }
    
    var bodyParameters: BodyParameters? {
        if method == .get {
            return nil
        }
        guard let json = parameters as? [String: Any] else { return nil }
        return FormURLEncodedBodyParameters(formObject: json)
    }
    
    var headerFields: [String: String] {
           return [
               "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
               "Accept": "application/json"
           ]
       }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw SessionError.noData(urlResponse)
        }
        
        #if DEBUG
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let url = urlResponse.url {
                    print(url)
                }
                print(json)
            } catch let parseError as NSError {
                print("Error with Json: \(parseError)")
            }
        #endif
        
        let decoder = JSONDecoder()
        if let decodingKey = optionalDecodingKey {
            decoder.keyDecodingStrategy = decodingKey
        }
        return try decoder.decode(Response.self, from: data)
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard let data = object as? Data else {
            throw SessionError.noData(urlResponse)
        }
        guard  200..<300 ~= urlResponse.statusCode else {
            let message = try? JSONDecoder().decode(SessionError.Message.self, from: data)
            throw SessionError.unacceptableStatusCode(urlResponse.statusCode, message)
        }
        return object
    }
}
