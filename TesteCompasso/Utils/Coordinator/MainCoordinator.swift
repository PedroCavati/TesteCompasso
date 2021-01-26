//
//  MainCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 25/01/21.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var eventService: EventService
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.eventService = EventService()
    }
    
    func start() {
        navigationController.delegate = self
        let vc = EventListViewController(eventService: self.eventService)
        vc.title = "EventListViewController"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showEventDetail(for eventId: String) {
        let child = EventDetailCoordinator(navigationController: self.navigationController, with: self.eventService, for: eventId)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        /*
        if let eventDetailViewController = fromViewController as? EventDetailViewController {
            self.childDidFinish(eventDetailViewController.coordinator)
        }
        */
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

//var childCoordinators: [Coordinator]
//    var navigationController: UINavigationController
//
//    let eventService: EventService
//    let window: UIWindow
//    let rootViewController: UINavigationController
////    let eventListCoordinator: EventListCoordinator
//
//    init(window: UIWindow) {
//        self.childCoordinators = []
//        self.navigationController = UINavigationController()
//        self.window = window
//        rootViewController = UINavigationController()
//        eventService = EventService()
//        rootViewController.navigationBar.prefersLargeTitles = true
//
////        eventListCoordinator = EventListCoordinator(presenter: rootViewController, eventService: eventService)
//    }
//
//    func start() {
//        let vc = EventListViewController(eventService: self.eventService)
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
//    }
