//
//  AttendantsView.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit

class AttendantsView: UIView {
    
    lazy var attendantsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AttendantCell.self, forCellReuseIdentifier: "attendantCell")
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        return tableView
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


// MARK:- ViewCodable
extension AttendantsView: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(attendantsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            attendantsTableView.topAnchor.constraint(equalTo: self.topAnchor),
            attendantsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            attendantsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            attendantsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
}

