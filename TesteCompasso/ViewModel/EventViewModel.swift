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
    let id: Int
    
    init(event: Event) {
        self.title = event.title
        self.id = Int(event.id) ?? <#default value#>
    }
}
