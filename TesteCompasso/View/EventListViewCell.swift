//
//  EventListViewCell.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 24/01/21.
//

import Foundation
import UIKit

class EventListViewCell: UITableViewCell {
    
    var eventViewModel: EventViewModel! {
        didSet {
            self.titleLabel.text = eventViewModel.title
            self.dateLabel.text = "29/06/2000"
            self.accessoryType = .disclosureIndicator
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = ""
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .thin)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventListViewCell: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(dateLabel)
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.dateLabel.topAnchor),
            
            self.dateLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.dateLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            self.dateLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
    
}
