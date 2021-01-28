//
//  AttendantsViewController.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 28/01/21.
//

import Foundation
import UIKit

class AttendantsViewController: UIViewController {
    
    /// View's responsible for the content to be rendered inside this ViewController
    private var attendantsView: AttendantsView { return self.view as! AttendantsView }
    
    /// AttendantsViewModels to be displayed in the tableView
    private var attendantsViewModels: [PeopleViewModel]
    
    /// View's Coordinator
    weak var coordinator: AttendantsListCoordinator?
    
    init(attendants: [PeopleViewModel]) {
        self.attendantsViewModels = attendants
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let attendantsView = AttendantsView(frame: UIScreen.main.bounds)
        
        attendantsView.attendantsTableView.delegate = self
        attendantsView.attendantsTableView.dataSource = self
        
        self.view = attendantsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
    }
    
}

extension AttendantsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attendantsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attendantCell", for: indexPath) as! AttendantCell
        let attendantViewModel = attendantsViewModels[indexPath.row]
        cell.attendantViewModel = attendantViewModel
        return cell
    }
    
    func setupNavigationController() {
        navigationController?.title = "Interessados"
    }
    
}
