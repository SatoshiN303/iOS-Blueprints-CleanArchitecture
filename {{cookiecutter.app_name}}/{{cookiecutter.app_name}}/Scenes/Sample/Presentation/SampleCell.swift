//
//  SampleCell.swift
//  {{cookiecutter.app_name}}
//
//  Copyright © 2020 {{cookiecutter.company_name}}. All rights reserved.
//

import UIKit

public final class SampleCell: UITableViewCell, NibReusable {

    @IBOutlet public private(set) weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 8
            containerView.layer.masksToBounds = true
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }

    @IBOutlet public private(set) weak var repositoryNameLabel: UILabel!
    @IBOutlet public private(set) weak var descriptionLabel: UILabel!
    @IBOutlet public private(set) weak var languageContainerView: UIView!
    @IBOutlet public private(set) weak var languageLabel: UILabel!
    @IBOutlet public private(set) weak var starLabel: UILabel!

    public func configure(with repository: Repository) {
        repositoryNameLabel.text = repository.fullName

        if let description = repository.description {
            descriptionLabel.isHidden = false
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
            descriptionLabel.text = nil
        }

        if let language = repository.language {
            languageContainerView.isHidden = false
            languageLabel.text = language
        } else {
            languageContainerView.isHidden = true
            languageLabel.text = nil
        }

        starLabel.text = "★ \(repository.stargazersCount)"
    }
}
