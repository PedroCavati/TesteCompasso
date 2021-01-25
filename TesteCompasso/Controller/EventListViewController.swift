//
//  EventListViewController.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 23/01/21.
//

import UIKit

class EventListViewController: UIViewController {
    
    var eventViewModels = [EventViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func loadView() {
        let eventListView = EventListView(frame: UIScreen.main.bounds)
        
        eventListView.setEventTableView(delegate: self, datasource: self)
        
        self.view = eventListView
    }
    
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
        
}
