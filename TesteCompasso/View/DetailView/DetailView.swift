//
//  DetailView.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 24/01/21.
//

import Foundation
import UIKit
import MapKit

class DetailView: UIView {
    
    var eventViewModel: EventViewModel! {
        didSet {
            
        }
    }
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.frame = .zero
        mapView.mapType = .standard
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        return mapView
    }()
    
    lazy var informationView: InformationView = {
        let informationView = InformationView()
        informationView.translatesAutoresizingMaskIntoConstraints = false
        return informationView
    }()

    lazy var peopleTableView: UITableView = {
        let peopleTableView = UITableView()
        peopleTableView.translatesAutoresizingMaskIntoConstraints = false
        peopleTableView.allowsSelection = false
        return peopleTableView
    }()

    lazy var checkInButton: UIButton = {
        let checkInButton = UIButton()
        checkInButton.translatesAutoresizingMaskIntoConstraints = false
//        checkInButton.backgroundColor = .systemBlue
//        checkInButton.titleLabel?.textColor = .white
        checkInButton.setTitle("CHECK-IN", for: .normal)
        checkInButton.setTitleColor(.systemBlue, for: .normal)
        return checkInButton
    }()

    lazy var shareButton: UIButton = {
        let shareButton = UIButton()
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return shareButton
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

extension DetailView: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(mapView)
        self.addSubview(informationView)
        self.addSubview(peopleTableView)
        self.addSubview(checkInButton)
        self.addSubview(shareButton)
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            self.mapView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mapView.heightAnchor.constraint(equalToConstant: 150),
            
            self.informationView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
            self.informationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.informationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.peopleTableView.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 10),
            self.peopleTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.peopleTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.checkInButton.topAnchor.constraint(equalTo: peopleTableView.bottomAnchor, constant: 20),
            self.checkInButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.checkInButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            self.checkInButton.heightAnchor.constraint(equalToConstant: 50),
            self.checkInButton.widthAnchor.constraint(equalToConstant: 120),

            self.shareButton.centerYAnchor.constraint(equalTo: checkInButton.centerYAnchor),
            self.shareButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.shareButton.widthAnchor.constraint(equalToConstant: 50),
            self.shareButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
