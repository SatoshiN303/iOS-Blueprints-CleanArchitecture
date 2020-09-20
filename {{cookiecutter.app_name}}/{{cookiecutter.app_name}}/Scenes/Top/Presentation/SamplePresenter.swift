//
//  SamplePresenter.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class SamplePresenter: SamplePresenterInputProtocol {
    
    weak var view: SamplePresenterOutputProtocol!
    var useCase: SampleUseCaseInputProtocol!
}

extension SamplePresenter: SampleUseCaseOutputProtocol {
}
