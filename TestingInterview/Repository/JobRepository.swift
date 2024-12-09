//
//  JobRepository.swift
//  TestingInterview
//
//  Created by Marsha Likorawung on 09/12/24.
//

import Foundation
import UIKit

class JobRepository {
    func getAllJobs(completion: @escaping ([Job]?) -> Void) {
        let urlString = APIManager.shared.baseURL
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            print("Invalid URL: \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = RequestMethods.GET
        
        print("Sending request to: \(url)")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error fetching books: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                guard let data = data else {
                    print("No data received from the server")
                    completion(nil)
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode([Job].self, from: data)
                    print(response)
                    completion(response)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
    
}
