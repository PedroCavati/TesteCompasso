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
        
        detailView.showAttendantsListButton.addTarget(self, action: #selector(showAttendants), for: .touchUpInside)
        
        detailView.showMapButton.addTarget(self, action: #selector(showEventLocation), for: .touchUpInside)
        
        detailView.checkInButton.addTarget(self, action: #selector(checkIn), for: .touchUpInside)
        
        detailView.shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        
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
    
    @objc func showAttendants() {
        coordinator?.showAttendantsList(peopleList: eventDetailViewModel?.attendants ?? [])
    }
    
    @objc func showEventLocation() {
        if let eventCoordinates =  eventDetailViewModel?.coordinates {
            coordinator?.showEventLocation(with: eventCoordinates)
        }
    }
    
    @objc func checkIn() {
        coordinator?.showCheckIn(for: eventDetailViewModel?.id ?? "")
    }
    
    @objc func share() {
        guard let eventTitle = eventDetailViewModel?.title else {
            return
        }
        let vc = UIActivityViewController(activityItems: ["Você está sendo convidado para participar de \(eventTitle)"], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
}
