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
        tableView.register(EventList.self, forCellReuseIdentifier: "eventCell")
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    lazy var tableViewActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EventListView {
    
    func toggleActivityIndicator() {
        if self.tableViewActivityIndicator.isAnimating {
            self.tableViewActivityIndicator.isHidden = false
            self.tableViewActivityIndicator.stopAnimating()
            self.eventTableView.isHidden = false
        } else {
            self.tableViewActivityIndicator.isHidden = false
            self.tableViewActivityIndicator.startAnimating()
            self.eventTableView.isHidden = true
        }
    }
    
}

// MARK:- ViewCodable
extension EventListView: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(eventTableView)
        self.addSubview(tableViewActivityIndicator)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            eventTableView.topAnchor.constraint(equalTo: self.topAnchor),
            eventTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            eventTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            eventTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            tableViewActivityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            tableViewActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
