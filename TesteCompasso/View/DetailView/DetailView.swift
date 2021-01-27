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
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade"
        textView.backgroundColor = .systemGroupedBackground
        textView.isEditable = false
        return textView
    }()
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.mapType = .standard
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        return mapView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "29/06/2000 00:00"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.backgroundColor = .systemGroupedBackground
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text  = "R$ 29,00"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.backgroundColor = .systemGroupedBackground
        return label
    }()
    
    lazy var dateAndPriceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        return stackView
    }()
    
    lazy var checkInButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("CHECK-IN", for: .normal)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return button
    }()
    
    lazy var checkInAndShareButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
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
        self.addSubview(mapView)
        self.addSubview(dateAndPriceStackView)
        dateAndPriceStackView.addArrangedSubview(dateLabel)
        dateAndPriceStackView.addArrangedSubview(priceLabel)
        addSubview(checkInAndShareButtonStackView)
        checkInAndShareButtonStackView.addArrangedSubview(checkInButton)
        checkInAndShareButtonStackView.addArrangedSubview(shareButton)
        
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        portraitConstraints = [
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.descriptionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.descriptionView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            self.descriptionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.descriptionView.heightAnchor.constraint(equalToConstant: 160),
            
            self.descriptionTextView.leadingAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.leadingAnchor),
            self.descriptionTextView.topAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.topAnchor),
            self.descriptionTextView.trailingAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.trailingAnchor),
            self.descriptionTextView.bottomAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.bottomAnchor),
            
            self.mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mapView.topAnchor.constraint(equalTo: self.descriptionView.bottomAnchor, constant: 10),
            self.mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mapView.heightAnchor.constraint(greaterThanOrEqualToConstant: 170),
            
            self.dateAndPriceStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.dateAndPriceStackView.topAnchor.constraint(equalTo: self.mapView.bottomAnchor, constant: 10),
            self.dateAndPriceStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            self.checkInButton.heightAnchor.constraint(equalToConstant: 70),
            self.checkInButton.widthAnchor.constraint(equalToConstant: 70),
            
            self.shareButton.heightAnchor.constraint(equalToConstant: 70),
            self.shareButton.widthAnchor.constraint(equalToConstant: 70),
            
            self.checkInAndShareButtonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.checkInAndShareButtonStackView.topAnchor.constraint(equalTo: self.dateAndPriceStackView.bottomAnchor, constant: 10),
            self.checkInAndShareButtonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.checkInAndShareButtonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        landscapeConstraints = [
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.mapView.leadingAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.mapView.heightAnchor),
            
            self.mapView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mapView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            
            self.descriptionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.descriptionView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
            self.descriptionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.descriptionView.heightAnchor.constraint(equalToConstant: 160),
            
            self.descriptionTextView.leadingAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.leadingAnchor),
            self.descriptionTextView.topAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.topAnchor),
            self.descriptionTextView.trailingAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.trailingAnchor),
            self.descriptionTextView.bottomAnchor.constraint(equalTo: self.descriptionView.layoutMarginsGuide.bottomAnchor),
            
            self.dateAndPriceStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.dateAndPriceStackView.topAnchor.constraint(equalTo: self.descriptionView.bottomAnchor, constant: 10),
            self.dateAndPriceStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            self.checkInButton.heightAnchor.constraint(equalToConstant: 70),
            self.checkInButton.widthAnchor.constraint(equalToConstant: 70),
            
            self.shareButton.heightAnchor.constraint(equalToConstant: 70),
            self.shareButton.widthAnchor.constraint(equalToConstant: 70),
            
            self.checkInAndShareButtonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.checkInAndShareButtonStackView.topAnchor.constraint(equalTo: self.dateAndPriceStackView.bottomAnchor, constant: 10),
            self.checkInAndShareButtonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.checkInAndShareButtonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.activate(self.landscapeConstraints)
        } else {
            NSLayoutConstraint.activate(self.portraitConstraints)
        }
    }
    
}
