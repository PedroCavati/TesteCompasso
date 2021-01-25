//
//  EventViewModel.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 24/01/21.
//

import Foundation
import UIKit

struct EventViewModel {
    let title: String
    let id: String
    let date: String
    let time: String
    
    init(event: Event) {
        self.title = event.title
        self.id = event.id
        
        let dateFromEpochTime = Date(timeIntervalSince1970: TimeInterval(event.date))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        self.date = dateFormatter.string(from: dateFromEpochTime)
        
        dateFormatter.dateFormat = "HH:mm"
        
        self.time = dateFormatter.string(from: dateFromEpochTime)
        
    }
    
    init(event: EventDetail) {
        self.title = event.title
        self.id = event.id
        
        let dateFromEpochTime = Date(timeIntervalSince1970: TimeInterval(event.date))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        self.date = dateFormatter.string(from: dateFromEpochTime)
        
        dateFormatter.dateFormat = "HH:mm"
        
        self.time = dateFormatter.string(from: dateFromEpochTime)
        
    }
}
