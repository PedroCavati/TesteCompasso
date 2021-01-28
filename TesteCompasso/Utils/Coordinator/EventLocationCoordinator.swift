//
//  AttendantsViewCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit
import MapKit

class EventLocationCoordinator: Coordinator {
    weak var parentCoordinator: EventDetailCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var eventCoordinates: CLLocationCoordinate2D
    
    init(navigationController: UINavigationController, with eventCoordinates: CLLocationCoordinate2D) {
        self.navigationController = navigationController
        self.eventCoordinates = eventCoordinates
    }
    
    func start() {
        let vc = EventLocationViewController(eventCoordinates: eventCoordinates)
        let navController = UINavigationController(rootViewController: vc)
        vc.coordinator = self
        navigationController.showDetailViewController(navController, sender: self)
    }
    
}
