//
//  SampleUseCase.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Swinject
import UIKit

class SampleUseCase: SampleUseCaseInputProtocol {
    
    weak var presenter: SampleUseCaseOutputProtocol!
    var gateway: SampleGatewayProtocol!
    
}
