//
//  SamplePresenter.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class SamplePresenter {
    private (set) var repositories: [Repository] = [Repository]()

    weak var view: SamplePresenterOutputProtocol!
    var useCase: SampleUseCaseInputProtocol!
}

extension SamplePresenter: SamplePresenterInputProtocol {
        
    var rowCount: Int {
        return repositories.count
    }
    
    func searchRepository(_ keyword: String, page: Int?) {
        view.showIndicator()
        useCase.fetch(keyword, page: page)
    }

    func sampleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleCell.reuseID, for: indexPath)

        if let sampleCell = cell as? SampleCell, !repositories.isEmpty {
            let repository = repositories[indexPath.row]
            sampleCell.configure(with: repository)
        }
        
        return cell
    }
    
    func didSelect(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> Repository? {
        tableView.deselectRow(at: indexPath, animated: false)
        if repositories.isEmpty {
            return nil
        }
        return repositories[indexPath.row]
    }
    
    func pagination(_ scrollView: UIScrollView) {
        // TODO:
    }
}

extension SamplePresenter: SampleUseCaseOutputProtocol {
    func fetchSucceeded(_ repositories: [Repository]) {
        self.repositories = repositories
        view.reloadData()
        view.hideIndicator()
    }
    
    func fetchFailed(_ error: SessionError) {
        // TODO:
    }
}
