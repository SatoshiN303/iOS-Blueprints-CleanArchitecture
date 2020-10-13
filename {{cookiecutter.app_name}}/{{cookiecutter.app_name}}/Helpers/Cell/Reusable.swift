//
//  Reusable.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import UIKit


public typealias NibReusable = Reusable & NibLoadable

public protocol Reusable: class {}
public protocol NibLoadable: class {}

extension Reusable {
    public static var reuseID: String {
        return String(describing: self)
    }
}

extension NibLoadable {
    public static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
