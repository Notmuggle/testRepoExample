//
//  ResponseBuilder.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class ResponseBuilder: NSObject {

    func getHomeData(onCompletion: @escaping (HomeDataModal?, Bool) -> Void){
        
        let networkCallTrial = APINetworkCalManager()
        networkCallTrial.getApiResponse(for: .home){data, error in
            
            let decoder = JSONDecoder()
            
            if let data = data,
                let responseObject = (try? JSONSerialization.jsonObject(with: data)),
                let jsonData = try? JSONSerialization.data(withJSONObject:responseObject),
                let homeResponseData = try? decoder.decode(HomeDataModal.self, from: jsonData){
                onCompletion(homeResponseData, true)
            }else{
                onCompletion(nil,false)
            }
        }
    }
    
    func getAllData(onCompletion: @escaping (AllDataModel?, Bool) -> Void){
        
        let networkCallTrial = APINetworkCalManager()
        networkCallTrial.getApiResponse(for: .all){data, error in
            
            let decoder = JSONDecoder()
            
            if let data = data,
                let responseObject = (try? JSONSerialization.jsonObject(with: data)),
                let jsonData = try? JSONSerialization.data(withJSONObject:responseObject),
                let allDataResponseData = try? decoder.decode(AllDataModel.self, from: jsonData){
                onCompletion(allDataResponseData, true)
            }else{
                onCompletion(nil,false)
            }
        }
    }
    
    
}
