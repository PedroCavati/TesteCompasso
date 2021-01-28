//
//  EventLocationViewController.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import UIKit
import MapKit

class EventLocationViewController: UIViewController {
    
    private var eventLocationView: EventLocationView { return self.view as! EventLocationView }
    
    private var eventCoordinates: CLLocationCoordinate2D
    
    weak var coordinator: EventLocationCoordinator?
    
    init(eventCoordinates: CLLocationCoordinate2D) {
        self.eventCoordinates = eventCoordinates
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        let eventView = EventLocationView(frame: UIScreen.main.bounds)
        
        eventView.eventCoordinates = eventCoordinates
        
        self.view = eventView
    }

}
