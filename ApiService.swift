//
//  ApiService.swift
//  MongoAPIPr
//
//  Created by Aisultan Zhaksytayev on 08.01.2023.
//

import Foundation

class ApiService {
    private var dataTask: URLSessionDataTask?
    
    func getQuestionsData(completion: @escaping(Result<QuestionsData, Error>) -> Void) {
        
        let questionsURL = "https://data.mongodb-api.com/app/midka-xjiwy/endpoint/data/v1"
        
        
        guard let url = URL(string: questionsURL) else {return}
        
        //create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //handle task
            if let  error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let respon
                    se = response as? HTTPURLResponse else {
                //handle empty respnse
                print("empty response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                //handle empty data
                print("empty data")
                return
            }
            
            do {
                //parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(QuestionsData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
