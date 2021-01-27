//
//  EventDetailViewModel.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 27/01/21.
//

import Foundation
struct EventDetailViewModel {
    let title: String
    let id: String
    let date: String
    let image: String
    
    init(event: EventDetail) {
        self.title = event.title
        self.id = event.id
        
        let dateFromEpochTime = Date(timeIntervalSince1970: TimeInterval(event.date))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        self.date = dateFormatter.string(from: dateFromEpochTime)
        
        self.image = event.image
        
    }
}
