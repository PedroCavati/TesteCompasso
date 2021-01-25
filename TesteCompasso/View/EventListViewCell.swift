//
//  EventListViewCell.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 24/01/21.
//

import Foundation
import UIKit

class EventListViewCell: UITableViewCell {
    
    var eventModel: EventViewModel! {
        didSet {
            
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = ""
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
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
        let margin = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: margin.topAnchor, constant: 10),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.accessoryView?.leadingAnchor ?? margin.trailingAnchor, constant: -10),
            self.titleLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 10),
            
            self.dateLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 10),
            self.dateLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -10),
            self.dateLabel.trailingAnchor.constraint(equalTo: self.accessoryView?.leadingAnchor ?? margin.trailingAnchor, constant: -50)
        ])
    }
    
}
