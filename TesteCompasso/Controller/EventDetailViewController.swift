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
    
    private var eventModel: EventViewModel?
    
    weak var coordinator: EventDetailCoordinator?
    
    init(with eventService: EventService, for eventId: String) {
        self.eventService = eventService
        self.eventId = eventId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
