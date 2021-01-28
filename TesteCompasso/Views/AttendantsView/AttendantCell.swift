//
//  AttendantCell.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit

class AttendantCell: UITableViewCell {
    
    var attendantViewModel: PeopleViewModel! {
        didSet {
            nameLabel.text = attendantViewModel.name
            emailLabel.text = attendantViewModel.email
        }
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AttendantCell: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(nameLabel)
        self.addSubview(emailLabel)
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.nameLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.emailLabel.topAnchor, constant: -5),
            
            self.emailLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.emailLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            self.emailLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
    
}
