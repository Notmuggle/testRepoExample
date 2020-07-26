//
//  ViewController.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let responseBuilder: ResponseBuilder = ResponseBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        // Do any additional setup after loading the view.
    }

    
    func updateData(){
        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
        dispatchQueue.async{
            self.responseBuilder.getHomeData(){(movieList, status) in
                if let nowPlayingList:HomeDataModal = movieList, status{
                    //also pass data to next view
                }
            }
        }
        
        
    }

}

