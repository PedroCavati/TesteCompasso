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
    
    var eventDetailViewModel: EventDetailViewModel! {
        didSet {
            imageView.load(imageUrl: eventDetailViewModel.image)
            descriptionTextView.text = eventDetailViewModel.description
            dateLabel.text = "Data: \(eventDetailViewModel.date)"
            priceLabel.text = "Preço: \(eventDetailViewModel.price)"
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var descriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        return textView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var showMapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.setTitle("LOCAL", for: .normal)
        return button
    }()
    
    lazy var showAttendantsListButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.setTitle("INTERESSADOS", for: .normal)
        return button
    }()
    
    lazy var checkInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.setTitle("CHECK-IN", for: .normal)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return button
    }()
    
    var portraitConstraints: [NSLayoutConstraint] = []
    
    var landscapeConstraints: [NSLayoutConstraint] = []
    
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
        self.addSubview(imageView)
        self.addSubview(descriptionView)
        descriptionView.addSubview(descriptionTextView)
        self.addSubview(dateLabel)
        self.addSubview(priceLabel)
        self.addSubview(showMapButton)
        self.addSubview(showAttendantsListButton)
        self.addSubview(checkInButton)
        self.addSubview(shareButton)
        
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        portraitConstraints = [
            self.imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            
            self.descriptionTextView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            self.descriptionTextView.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            self.descriptionTextView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            self.descriptionTextView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            
            self.descriptionView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.descriptionView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.0),
            self.descriptionView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.descriptionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
            
            self.dateLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.dateLabel.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 10.0),
            self.dateLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            self.priceLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.priceLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5.0),
            self.priceLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            self.showMapButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.showMapButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30.0),
            
            self.showAttendantsListButton.leadingAnchor.constraint(equalTo: showMapButton.trailingAnchor, constant: 10.0),
            self.showAttendantsListButton.centerYAnchor.constraint(equalTo: showMapButton.centerYAnchor),
            self.showAttendantsListButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.showAttendantsListButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7),
            
            self.checkInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.checkInButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.6),
            self.checkInButton.bottomAnchor.constraint(equalTo: shareButton.topAnchor, constant: -15.0),
            
            self.shareButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.shareButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30.0)
            
        ]
        
        landscapeConstraints = [
            self.imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            
            self.descriptionTextView.leadingAnchor.constraint(equalTo: descriptionView.layoutMarginsGuide.leadingAnchor),
            self.descriptionTextView.topAnchor.constraint(equalTo: descriptionView.layoutMarginsGuide.topAnchor),
            self.descriptionTextView.trailingAnchor.constraint(equalTo: descriptionView.layoutMarginsGuide.trailingAnchor),
            self.descriptionTextView.bottomAnchor.constraint(equalTo: descriptionView.layoutMarginsGuide.bottomAnchor),
            
            self.descriptionView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            self.descriptionView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.descriptionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.descriptionView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.80),
            self.descriptionView.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            
            self.dateLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.dateLabel.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 30.0),
            
            self.priceLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 20.0),
            self.priceLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            self.priceLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            self.showMapButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.showMapButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30.0),
            
            self.showAttendantsListButton.leadingAnchor.constraint(equalTo: showMapButton.trailingAnchor, constant: 10.0),
            self.showAttendantsListButton.centerYAnchor.constraint(equalTo: showMapButton.centerYAnchor),
            self.showAttendantsListButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.showAttendantsListButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.6),
            
            self.checkInButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.checkInButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.4),
            self.checkInButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10.0),
            self.checkInButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: 15.0),
            
            self.shareButton.centerYAnchor.constraint(equalTo: checkInButton.centerYAnchor),
            self.shareButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ]
        
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.activate(self.landscapeConstraints)
        } else {
            NSLayoutConstraint.activate(self.portraitConstraints)
        }
    }
    
}
