//
//  EventService.swift
//  TesteCompasso
//
//  Created by Pedro Henrique Cavalcante de Sousa on 24/01/21.
//

import Foundation

class EventService {
    
    static let shared = EventService()
    
    func fetchEvents(completion: @escaping ([Event]?, Error?) -> ()) {
        
        let urlString = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch events:", err)
                return
            }
            
            guard let data = data else { return }
            do {
                let events = try JSONDecoder().decode([Event].self, from: data)
                DispatchQueue.main.async {
                    completion(events, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
        
    }
    
}
