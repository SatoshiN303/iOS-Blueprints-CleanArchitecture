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
    
    func fetch(_ keyword: String, page: Int?) {
        let params = SearchRepositoriesParameters(query: keyword, page: String(page ?? 1), perPage: nil, sort: .stars, order: .desc)
        let request = SearchRepositryRequest(parameter: params)
        gateway.fetch(request: request) { [weak self] result in
            guard let self = self else { return }
            result
            .ifSuccess { response in
                self.presenter.fetchSucceeded(response.items)
            }
            .ifError { error in
                // TODO:
                print(error)
            }
        }
    }
}
