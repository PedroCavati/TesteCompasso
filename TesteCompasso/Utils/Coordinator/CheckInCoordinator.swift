//
//  CheckInCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit

class CheckInCoordinator: Coordinator {
    weak var parentCoordinator: EventDetailCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var eventId: String
    
    init(navigationController: UINavigationController, with eventId: String) {
        self.navigationController = navigationController
        self.eventId = eventId
    }
    
    func start() {
        let vc = CheckInViewController(eventId: eventId)
        let navController = UINavigationController(rootViewController: vc)
        vc.coordinator = self
        navigationController.showDetailViewController(navController, sender: self)
    }
    
}
