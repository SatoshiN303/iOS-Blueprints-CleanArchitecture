//
//  SampleViewController.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class SampleViewController: UIViewController {
    
    var presenter: SamplePresenterInputProtocol!
    
    static func makeInstance() -> SampleViewController {
        guard let vc = SwinjectStoryboard.create(name: "Sample", bundle: nil).instantiateInitialViewController() as? SampleViewController else {
            fatalError()
        }
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("!!!!!!!!!!!!!!!!!!!!!!")
    }
}

extension SampleViewController: SamplePresenterOutputProtocol {
}
