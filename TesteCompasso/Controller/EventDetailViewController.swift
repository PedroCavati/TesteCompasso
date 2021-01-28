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
    
    private var eventDetailViewModel: EventDetailViewModel? {
        didSet {
            self.setupNavigationController()
        }
    }
    
    private var detailView: DetailView { return self.view as! DetailView}
    
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

        fetchEventDetail()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.deactivate(detailView.portraitConstraints)
            NSLayoutConstraint.activate(detailView.landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(detailView.landscapeConstraints)
            NSLayoutConstraint.activate(detailView.portraitConstraints)
        }
        self.view.layoutIfNeeded()
    }
    
}

extension EventDetailViewController {
    
    func fetchEventDetail() {
        eventService.fetchEventDetail(for: self.eventId) { [weak self] (eventDetail, err) in
            guard let strongSelf = self else { return }
            if let eventDetail = eventDetail {
                strongSelf.eventDetailViewModel = EventDetailViewModel(event: eventDetail)
                strongSelf.detailView.eventDetailViewModel = strongSelf.eventDetailViewModel
            }
        }
    }
    
    func setupNavigationController() {
        navigationItem.title = self.eventDetailViewModel?.title
    }
}
