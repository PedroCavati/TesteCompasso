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
            imageView.load(imageUrl: "https://cdn2.thecatapi.com/images/7gf.jpg")
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
//        imageView.load(imageUrl: "https://cdn2.thecatapi.com/images/7gf.jpg")
        return imageView
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
        self.addSubview(imageView)
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: margins.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
    
}
