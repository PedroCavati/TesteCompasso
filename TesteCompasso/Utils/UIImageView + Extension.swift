//
//  UIImageView + Extension.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 26/01/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    func load(imageUrl: String) {
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        activityIndicator.startAnimating()
        
        guard let url = URL(string: imageUrl) else {
            self.image = UIImage(systemName: "rectangle.fill.on.rectangle.fill.slash.fill")
            activityIndicator.removeFromSuperview()
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        activityIndicator.removeFromSuperview()
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.image = UIImage(systemName: "rectangle.fill.on.rectangle.fill.slash.fill")
                        activityIndicator.removeFromSuperview()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = UIImage(systemName: "rectangle.fill.on.rectangle.fill.slash.fill")
                    activityIndicator.removeFromSuperview()
                }
            }
        }
    }
    
}
