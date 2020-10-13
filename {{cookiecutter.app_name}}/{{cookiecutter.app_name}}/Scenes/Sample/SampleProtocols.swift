//
//  SampleProtocols.swift
//  {{cookiecutter.app_name}}
//
// Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import UIKit

protocol SampleGatewayProtocol {
}

protocol SampleUseCaseInputProtocol {
}

protocol SampleUseCaseOutputProtocol: class {
}

protocol SamplePresenterInputProtocol {
    var rowCount: Int { get }
    func sampleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func didSelect(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> Repository?
}

protocol SamplePresenterOutputProtocol: class {
}
