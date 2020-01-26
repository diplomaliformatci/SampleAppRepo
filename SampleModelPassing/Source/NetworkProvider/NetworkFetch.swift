//
//  NetworkFetch.swift
//  SampleModelPassing
//
//  Created by Can Kincal on 25.01.2020.
//  Copyright © 2020 Can Kincal. All rights reserved.
//

import Foundation

struct NetworkFetch<T: Decodable> {
    
    let urlSession: URLSession!
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchData(from endpoint: EndpointType,
                   completed: @escaping (_ data: T?, _ statusCode: Int, _ error: String) -> ()) {
        
        guard let url = endpoint.getUrl else { return }
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                let result = self.parseData(data: data) else { completed(nil, 0, "Network Error"); return }

            completed(result, response.statusCode, "")
        }
        task.resume()
    }
    
    func parseData(data: Data) -> T? {
        var result: T?
        do {
           result = try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("cannot decode")
        }
        return result
    }
}

