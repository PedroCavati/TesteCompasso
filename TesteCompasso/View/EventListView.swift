//
//  EventListView.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 24/01/21.
//

import Foundation
import UIKit

class EventListView: UIView {
    
    lazy var eventTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EventListViewCell.self, forCellReuseIdentifier: "eventCell")
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- ViewCodable
extension EventListView: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(eventTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            eventTableView.topAnchor.constraint(equalTo: self.topAnchor),
            eventTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            eventTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            eventTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    
}
