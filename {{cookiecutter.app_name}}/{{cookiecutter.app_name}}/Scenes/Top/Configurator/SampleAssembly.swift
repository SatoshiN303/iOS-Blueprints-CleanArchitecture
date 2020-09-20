//
//  SampleAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by 佐藤 慎 on 2020/09/20.
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class SampleAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SampleUseCase.self) { (r, presenter: SamplePresenter) -> SampleUseCase in
            let usecase = SampleUseCase()
            usecase.gateway = r.resolve(SampleGateway.self, argument: usecase)
            usecase.presenter = presenter
            return usecase
        }
        
        container.register(SampleGateway.self) { (_, _: SampleUseCase) -> SampleGateway in
            let gateway = SampleGateway()
            return gateway
        }
        
        container.register(SamplePresenter.self) { (r, vc: SampleViewController) -> SamplePresenter in
            let presenter = SamplePresenter()
            presenter.view = vc
            presenter.useCase = r.resolve(SampleUseCase.self, argument: presenter)
            
            return presenter
        }
        
        container.storyboardInitCompleted(SampleViewController.self) { r, vc in
            vc.presenter = r.resolve(SamplePresenter.self, argument: vc)
        }
    }
}
