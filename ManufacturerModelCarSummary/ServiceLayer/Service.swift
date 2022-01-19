//
//  Service.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/20/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    
    static let shared = Service()
    
    var baseUrl: String {
        return "http://api-aws-eu-qa-1.auto1-test.com/v1/"
    }
    
    func call<T: Decodable>(urlString:String,requestMethod:HTTPMethod,
                            parameters:Parameters?,responseModel:T.Type,
                            completion: @escaping (Result<T, ErrorResult>) -> Void) {
        
        let finalUrl = baseUrl.appending(urlString);
        
        if !NetworkReachabilityManager()!.isReachable{
            completion(.failure(.network(message: "No internet connection")))
            return
        }
        
        guard let url = URL(string: finalUrl) else {
            completion(.failure(.network(message: "url is not valid")))
            return
        }
        
        Alamofire.request(url,
                          method: requestMethod,
                          parameters: parameters)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    
                    if let data = response.data {
                        do{
                            let mainError = try JSONDecoder().decode(MainError.self,from: data)
                            
                            guard mainError.status == nil else {
                                completion(.failure(.serviceError(serviceError:mainError)))
                                return
                            }
                            
                        }catch let error {
                            completion(.failure(.parser(message: "Malformed data received from \(urlString) service with error \(error.localizedDescription)")))
                            return
                        }
                        
                    }
                    completion(.failure(.network(message: "An error occured during request :")))
                    return
                }
                
                guard (response.result.value as? [String: Any]) != nil else {
                    completion(.failure(.parser(message: "Malformed data received from \(urlString) service")))
                    return
                }
                
                do{
                    
                    if let data = response.data {
                        let serviceResponseModel = try JSONDecoder().decode(responseModel,from: data)
                        completion(.success(serviceResponseModel))
                        return
                    }else{
                        completion(.failure(.parser(message: "unexpected error occurrred, Please try again later")))
                        return
                    }
                }catch let error {
                    completion(.failure(.parser(message: "Malformed data received from \(urlString) service with error \(error.localizedDescription)")))
                    return
                }
        }
    }
}
