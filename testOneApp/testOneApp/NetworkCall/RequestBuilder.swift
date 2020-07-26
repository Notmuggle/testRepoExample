//
//  RequestBuilder.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class RequestBuilder: NSObject {
    
    func setAllDataRequest(with urlComponents:URLComponents) ->URLRequest{
        var urlComponent:URLComponents = urlComponents
        
        urlComponent.queryItems = [
            URLQueryItem(name: "type", value: "all"),
        ]
        let request = URLRequest(url: (urlComponent.url)!)
        return request
    }
    
    func setHomeDataRequest(with urlComponents:URLComponents) ->URLRequest{
        
        var urlComponent:URLComponents = urlComponents
        
        urlComponent.queryItems = [
            URLQueryItem(name: "type", value: "home")
        ]
        let request = URLRequest(url: (urlComponent.url)!)
        return request
        
    }
    
    
    
}
