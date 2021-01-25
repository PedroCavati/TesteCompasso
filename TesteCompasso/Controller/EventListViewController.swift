//
//  EventListViewController.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 23/01/21.
//

import UIKit

class EventListViewController: UIViewController {
    
    var eventViewModels = [EventViewModel]()
    
    var eventListView: EventListView { return self.view as! EventListView }
    
    var eventService: EventService
    
    init(eventService: EventService) {
        self.eventService = eventService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationController()
        fetch()
    }
    
    override func loadView() {
        let eventListView = EventListView(frame: UIScreen.main.bounds)
        
        eventListView.eventTableView.delegate = self
        eventListView.eventTableView.dataSource = self
        
        self.view = eventListView
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
        
}

extension EventListViewController {
    func fetch() {
        eventService.fetchEvents { [weak self] (events, err) in
            guard  let strongSelf = self else { return }
            if let events = events {
                strongSelf.eventViewModels = events.map({return EventViewModel(event: $0)})
                strongSelf.eventListView.eventTableView.reloadData()
            }
        }
    }
    
    func setupNavigationController() {
        navigationItem.title = "Eventos"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
