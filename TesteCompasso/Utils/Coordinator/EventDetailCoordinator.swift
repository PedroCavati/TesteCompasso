//
//  EventDetailCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 26/01/21.
//

import Foundation
import UIKit

class EventDetailCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var eventService: EventService
    
    var eventId: String
    
    init(navigationController: UINavigationController, with eventService: EventService, for eventId: String) {
        self.navigationController = navigationController
        self.eventService = eventService
        self.eventId = eventId
    }
    
    func start() {
        /*
         let vc = EventDetailViewController()
         vc.title = "EventDetailViewController"
         vc.coordinator = self
         navigationController.pushViewController(vc, animated: true)
         */
    }
    
//    func didGetDismissed() {
//        parentCoordinator?.childDidFinish(self)
//    }
    
    
}
