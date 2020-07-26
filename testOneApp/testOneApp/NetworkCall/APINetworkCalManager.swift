//
//  APINetworkCalManager.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

enum NetworkCallType {
    case home
    case all
}

class APINetworkCalManager: NSObject {

    let requestBuilder:RequestBuilder = RequestBuilder()
    
    func getApiResponse(for callType:NetworkCallType, completion: @escaping (Data?, Error?) -> Void){
        let request = setRequestData(for: callType)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
            let response = response as? HTTPURLResponse,
            (200 ..< 300) ~= response.statusCode,
            error == nil else {
                completion(nil, error)
                return
        }
            completion(data, error)
        
    }
        task.resume()
    }
    
    func setRequestData(for callType:NetworkCallType) -> URLRequest{
        let urlComponents:URLComponents = URLComponents(string: Cosntants.endpoint)!
        
        if callType == .all{
        let request = requestBuilder.setAllDataRequest(with: urlComponents)
            return request
        }
            
        else {
        let request = requestBuilder.setHomeDataRequest(with: urlComponents)
            return request
        }
        
    }
    
    
    
}
