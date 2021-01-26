//
//  InformationView.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 26/01/21.
//

import Foundation
import UIKit

class InformationView: UIView {
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade"
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.backgroundColor = .systemGray6
        return descriptionLabel
    }()
    
    lazy var dateAndTimeLabel: UILabel = {
        let dateAndTimeLabel = UILabel()
        dateAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        dateAndTimeLabel.text = "29/06/2000  00:00"
        dateAndTimeLabel.numberOfLines = 1
        dateAndTimeLabel.textAlignment = .right
        dateAndTimeLabel.backgroundColor = .systemGray
        return dateAndTimeLabel
    }()
    
    lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "R$ 29,00"
        priceLabel.numberOfLines = 1
        priceLabel.textAlignment = .right
        priceLabel.backgroundColor = .systemGray
        return priceLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InformationView: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(descriptionLabel)
        self.addSubview(dateAndTimeLabel)
        self.addSubview(priceLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.dateAndTimeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            self.dateAndTimeLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            self.dateAndTimeLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            self.dateAndTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            self.priceLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
