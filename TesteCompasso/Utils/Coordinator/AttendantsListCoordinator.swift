//
//  AttendantsListCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit

class AttendantsListCoordinator: Coordinator {
    weak var parentCoordinator: EventDetailCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var attendants: [PeopleViewModel]
    
    init(navigationController: UINavigationController, with attendants: [PeopleViewModel]) {
        self.navigationController = navigationController
        self.attendants = attendants
    }
    
    func start() {
        let vc = AttendantsViewController(attendants: attendants)
        let navController = UINavigationController(rootViewController: vc)
        vc.coordinator = self
        navigationController.showDetailViewController(navController, sender: self)
    }
    
}
