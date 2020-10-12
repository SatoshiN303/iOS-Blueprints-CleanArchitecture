//
//  KeyedDecodingContainerExtension.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    public func decodeWithString(forKey key: KeyedDecodingContainer.Key) throws -> String {
        do {
            return try self.decode(String.self, forKey: key)
        } catch DecodingError.typeMismatch {
            return try String(self.decode(Int.self, forKey: key))
        }
    }
    
    public func decodeWithOptionalString(forKey key: KeyedDecodingContainer.Key) throws -> String? {
        do {
            return try self.decode(String.self, forKey: key)
        } catch DecodingError.typeMismatch {
            return try String(self.decode(Int.self, forKey: key))
        }
    }
    
    public func decodeWithInt(forKey key: KeyedDecodingContainer.Key) throws -> Int {
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch DecodingError.typeMismatch {
            if let value: Int = try Int(self.decode(String.self, forKey: key)) {
                return value
            }
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "value type mismatch")
        }
    }
    
    public func decodeWithOptionalInt(forKey key: KeyedDecodingContainer.Key) throws -> Int? {
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch DecodingError.typeMismatch {
            return try Int(self.decode(String.self, forKey: key))
        }
    }
    
    /// Float
    public func decodeWithFloat(forKey key: KeyedDecodingContainer.Key) throws -> Float {
        do {
            let value = try self.decode(Float.self, forKey: key)
            return value
        } catch DecodingError.typeMismatch {
            if let value: Float = try Float(self.decode(String.self, forKey: key)) {
                return value
            }
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "value type mismatch")
        }
    }
}
