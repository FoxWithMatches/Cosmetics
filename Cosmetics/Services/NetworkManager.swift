//
//  NetworkManager.swift
//  Cosmetics
//
//  Created by Alisa Ts on 30.11.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMakeUp(from url: String?, with completion: @escaping(MakeUp) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No eror description")
                return
            }
            do {
                let makeUpElement = try JSONDecoder().decode(MakeUp.self, from: data)
                DispatchQueue.main.async {
                    completion(makeUpElement)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}




