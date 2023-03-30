//
//  HomeViewModel.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/29/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // Private properties
    private let url = "https://api.publicapis.org/entries"
    
    // Data properties
    @Published var data: [Api] = []
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    
    
    // Fetch function
    func fetchData() {
        isLoading = true
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.cachePolicy = URLRequest.CachePolicy.returnCacheDataDontLoad
        URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.error = error
                } else if let data = data {
                    do {
                        
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(ApiResponse.self, from: data)
                        self.data = jsonData.entries
                    } catch let error {
                        self.error = error
                    }
                }
            }
        }
        .resume()
        
        
    }
}
