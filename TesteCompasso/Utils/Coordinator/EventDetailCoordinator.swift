//
//  EventDetailCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 26/01/21.
//

import Foundation
import UIKit
import MapKit

class EventDetailCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
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
        let vc = EventDetailViewController(with: eventService, for: eventId)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAttendantsList(peopleList: [PeopleViewModel]) {
        let child = AttendantsListCoordinator(navigationController: navigationController, with: peopleList)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func showCheckIn(for eventId: String) {
        let child = CheckInCoordinator(navigationController: navigationController, with: eventId)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func showEventLocation(with eventCoordinates: CLLocationCoordinate2D) {
        let child = EventLocationCoordinator(navigationController: navigationController, with: eventCoordinates)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        if let attendantsViewController = fromViewController as? AttendantsViewController {
            self.childDidFinish(attendantsViewController.coordinator)
        }
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
