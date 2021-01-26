//
//  EventDetailViewController.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 26/01/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    private var eventService: EventService
    
    private var eventId: String
    
    private var eventViewModel: EventViewModel? {
        didSet {
            self.setupNavigationController()
        }
    }
    
    weak var coordinator: EventDetailCoordinator?
    
    init(with eventService: EventService, for eventId: String) {
        self.eventService = eventService
        self.eventId = eventId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let detailView = DetailView(frame: UIScreen.main.bounds)
        
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetch()
    }
    
}

extension EventDetailViewController {
    
    func fetch() {
        eventService.fetchEventDetail(for: self.eventId) { [weak self] (eventDetail, err) in
            guard let strongSelf = self else { return }
            if let eventDetail = eventDetail {
                strongSelf.eventViewModel = EventViewModel(event: eventDetail)
            }
        }
    }
    
    func setupNavigationController() {
        navigationItem.title = self.eventViewModel?.title
    }
}
