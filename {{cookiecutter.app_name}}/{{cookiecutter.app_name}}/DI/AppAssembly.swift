//
//  AppAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class AppAssembly {
    class var assembler: Assembler? {
        return Assembler([
            SampleAssembly()
        ])
    }
}

extension SwinjectStoryboard {
    @objc
    class func setup() {
        guard
            let assembler = AppAssembly.assembler,
            let container = assembler.resolver as? Container
        else {
            fatalError()
        }
        defaultContainer = container
    }
}
