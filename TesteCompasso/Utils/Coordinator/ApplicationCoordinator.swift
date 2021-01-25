//
//  ApplicationCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 25/01/21.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    let eventService: EventService
    let window: UIWindow
    let rootViewController: UINavigationController
    let eventListCoordinator: EventListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        eventService = EventService()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        eventListCoordinator = EventListCoordinator(presenter: rootViewController, eventService: eventService)
    }
    
    func start() {
        window.rootViewController = rootViewController
        eventListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
