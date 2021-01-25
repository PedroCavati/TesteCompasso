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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetch()
    }
    
    func fetch() {
        EventService.shared.fetchEvents { [weak self] (events, err) in
            guard  let strongSelf = self else { return }
            if let events = events {
                strongSelf.eventViewModels = events.map({return EventViewModel(event: $0)})
                strongSelf.eventListView.eventTableView.reloadData()
            }
        }
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
