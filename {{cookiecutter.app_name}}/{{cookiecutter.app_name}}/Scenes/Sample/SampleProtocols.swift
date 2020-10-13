//
//  SampleProtocols.swift
//  {{cookiecutter.app_name}}
//
// Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import UIKit
import APIKit

protocol SampleGatewayProtocol: Fetchable {
}

protocol SampleUseCaseInputProtocol {
    func fetch(_ keyword: String, page: Int?)
}

protocol SampleUseCaseOutputProtocol: class {
    func fetchSucceeded(_ repositories: [Repository])
    func fetchFailed(_ error: SessionError)
    
}

protocol SamplePresenterInputProtocol {
    var rowCount: Int { get }
    func searchRepository(_ keyword: String, page: Int?)
    func sampleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func didSelect(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> Repository?
    func pagination(_ scrollView: UIScrollView)
}

protocol SamplePresenterOutputProtocol: class {
    func reloadData()
    func showErrorMessage(errMessage: [String]?)
    func showIndicator()
    func hideIndicator()
}
