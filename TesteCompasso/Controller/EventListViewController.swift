//
//  EventListViewController.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 23/01/21.
//

import UIKit

class EventListViewController: UIViewController {
    
    /// View's responsible for the content to be rendered inside this ViewController
    private var eventListView: EventListView { return self.view as! EventListView }
    
    /// EventService that'll allow you to fetch events
    private var eventService: EventService
    
    /// EventViewModels to be displayed in the tableView
    private var eventViewModels = [EventViewModel]()
    
    /// View's Coordinator
    weak var coordinator: MainCoordinator?
    
    init(eventService: EventService) {
        self.eventService = eventService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let eventListView = EventListView(frame: UIScreen.main.bounds)
                
        eventListView.eventTableView.delegate = self
        eventListView.eventTableView.dataSource = self
                
        self.view = eventListView
    }
    
    override func viewDidLoad() {
        fetch()
        setupNavigationController()
    }
    
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventListViewCell
        let eventViewModel = eventViewModels[indexPath.row]
        cell.eventViewModel = eventViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.coordinator?.showEventDetail(for: self.eventViewModels[indexPath.row].id)
    }
        
}

extension EventListViewController {
    func fetch() {
        eventService.fetchEvents { [weak self] (events, err) in
            guard let strongSelf = self else { return }
            if let events = events {
                strongSelf.eventViewModels = events.map({return EventViewModel(event: $0)})
                strongSelf.eventListView.eventTableView.reloadData()
            }
        }
    }
    
    func setupNavigationController() {
        navigationItem.title = "Eventos"
    }
}
