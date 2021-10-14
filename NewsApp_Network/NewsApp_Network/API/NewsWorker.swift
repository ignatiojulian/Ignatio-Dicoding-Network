//
//  NewsWorker.swift
//  Dependencies
//
//  Created by Ignatio Julian on 11/10/21.
//

import Foundation
import Alamofire

public class NewsWorker {
    
    public init() {}
    
    public func getNewsData(completion: @escaping (Result<NewsDomainModel, NSError>) -> Void) {
        AF.request(Constants.newsURL)
            .validate()
            .responseJSON(completionHandler: { (response) in
                guard let statusCode = response.response?.statusCode else {
                    // add custom error
                    let error = NSError(domain: Constants.newsURL, code: 0, userInfo: [NSLocalizedDescriptionKey: Constants.NetworkServiceErrorMessage])
                    print("at guard statusCode")
                    completion(.failure(error))
                    return
                }
                
                if statusCode == 200 {
                    // success request
                    guard let jsonResponse = try? response.result.get() else {
                        // add custom error
                        let error = NSError(domain: Constants.newsURL, code: 0, userInfo: [NSLocalizedDescriptionKey: Constants.NetworkServiceErrorMessage])
                        print("at jsonResponse")
                        completion(.failure(error))
                        return
                    }
                    guard let theJsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                        // add custom Error
                        let error = NSError(domain: Constants.newsURL, code: 0, userInfo: [NSLocalizedDescriptionKey: Constants.NetworkServiceErrorMessage])
                        print("at jsonData error")
                        completion(.failure(error))
                        return
                    }
                    guard let responseObject = try? JSONDecoder().decode(NewsDomainModel.self, from: theJsonData) else {
                        //add custom Error
                        let error = NSError(domain: Constants.newsURL, code: 0, userInfo: [NSLocalizedDescriptionKey: Constants.NetworkServiceErrorMessage])
                        print("at responseObject, error on parsing")
                        completion(.failure(error))
                        return
                    }
                    
                    print("Success API's Call")
                    completion(.success(responseObject))
                } else {
                    // add error depending on statusCode
                    let message = "Error Message Parse From Server"
                    let error = NSError(domain: Constants.newsURL, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
                    print(error)
                    completion(.failure(error))
                }
            })
    }
}

