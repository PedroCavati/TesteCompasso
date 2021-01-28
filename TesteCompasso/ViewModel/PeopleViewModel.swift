//
//  PeopleViewModel.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 27/01/21.
//

import Foundation
import UIKit

struct PeopleViewModel {
    
    let eventId: String
    let name: String
    let email: String
    
    init(people: People) {
        self.eventId = people.eventId
        self.name = people.name
        self.email = people.email
    }
    
}
