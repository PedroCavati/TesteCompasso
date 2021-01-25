//
//  EventListCoordinator.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 25/01/21.
//

import Foundation
import UIKit

class EventListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private let eventService: EventService
    private var eventListViewController: EventListViewController?
    
    init(presenter: UINavigationController, eventService: EventService) {
        self.presenter = presenter
        self.eventService = eventService
    }
    
    func start() {
        let eventListViewController = EventListViewController(eventService: eventService)
        eventListViewController.title = "EventListView"
        
        let eventListView = EventListView(frame: UIScreen.main.bounds)
        
        eventListView.eventTableView.delegate = eventListViewController
        eventListView.eventTableView.dataSource = eventListViewController
        
        eventListViewController.view = eventListView
        
        presenter.pushViewController(eventListViewController, animated: true)
        
        self.eventListViewController = eventListViewController
    }
}
