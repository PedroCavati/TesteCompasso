//
//  CheckInView.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit

class CheckInView: UIView {
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.text = "Nome"
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nome Sobrenome"
        textField.borderStyle = .line
        return textField
    }()
    
    lazy var emailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.text = "E-mail"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "interessado@evento.com"
        textField.borderStyle = .line
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.setTitle("CONFIRMAR", for: .normal)
        return button
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

extension CheckInView: ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(confirmButton)
    }
    
    func setupConstraints() {
        let margins = self.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100.0),
            
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5.0),
            nameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            nameTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.6),
            
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 50.0),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 5.0),
            emailTextField.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            emailTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.6),
            
            confirmButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.6),
            confirmButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 50.0)
        ])
    }
}
