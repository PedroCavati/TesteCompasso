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
        return mapView
    }()
    
    lazy var descriptionView: UIView = {
        let descriptionView = UIView()
        return descriptionView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        return descriptionLabel
    }()
    
}
