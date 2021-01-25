//
//  EventDetail.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 25/01/21.
//

import Foundation

struct EventDetail: Codable {
    let people: [People]
    let date: Int
    let description: String
    let image: String
    let longitude: Double
    let latitude: Double
    let price: Float
    let title: String
    let id: String
}
