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
        imageView.backgroundColor = .systemGroupedBackground
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
        label.textAlignment = .center
        return label
    }()
    
    lazy var showMapButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.setTitle("LOCATION", for: .normal)
        return button
    }()
    
    lazy var checkInButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.setTitle("CHECK-IN", for: .normal)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
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
//        self.addSubview(descriptionView)
//        descriptionView.addSubview(descriptionTextView)
//        self.addSubview(dateLabel)
//        self.addSubview(priceLabel)
//        self.addSubview(showMapButton)
//        self.addSubview(checkInButton)
//        self.addSubview(shareButton)
        
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        portraitConstraints = [
            self.imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        ]
        
        landscapeConstraints = [
            
        ]
        
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.activate(self.landscapeConstraints)
        } else {
            NSLayoutConstraint.activate(self.portraitConstraints)
        }
    }
    
}
