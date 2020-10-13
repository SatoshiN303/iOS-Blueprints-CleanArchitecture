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
    
    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) weak var searchBar: UISearchBar!
    
    static func makeInstance() -> SampleViewController {
        guard let vc = SwinjectStoryboard.create(name: "Sample", bundle: nil).instantiateInitialViewController() as? SampleViewController else {
            fatalError()
        }
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SampleCell.nib, forCellReuseIdentifier: SampleCell.reuseID)
    }
}

extension SampleViewController: SamplePresenterOutputProtocol {
}

extension SampleViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.view.backgroundColor = .black
        self.tableView.isUserInteractionEnabled = false
        self.tableView.alpha = 0.5
        self.searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        self.view.backgroundColor = .white
        self.tableView.isUserInteractionEnabled = true
        self.tableView.alpha = 1
        self.searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmpty {
            print(text)
        }
    }
}

extension SampleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.sampleCell(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repo = presenter.didSelect(tableView, cellForRowAt: indexPath) else {
            return
        }
        print(repo)
    }
}
