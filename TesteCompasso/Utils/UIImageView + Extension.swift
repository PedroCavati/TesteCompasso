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

//    private let _imageCache = NSCache<AnyObject, AnyObject>()
//
//    func loadImage(with url: URL){
//        let urlString = url.absoluteString
//        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
//            self.image = imageFromCache
//            return
//        }
//
//        DispatchQueue.global(qos: .background).async { [weak self] in
//            guard let self = self else { return }
//            do{
//                // cast from data to UIImage async
//                let data = try Data(contentsOf: url)
//                guard let image = UIImage(data: data) else { return }
//                self.imageCache.setObject(image, forKey: urlString as AnyObject)
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else { return }
//                    self.image = image
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }

