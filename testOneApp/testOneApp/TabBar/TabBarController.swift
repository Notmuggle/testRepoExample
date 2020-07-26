//
//  TabBarController.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreens()
        // Do any additional setup after loading the view.
    }
    
    func configureScreens(){
        let mainStoryboard = UIStoryboard(name: "LandingHomeView", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "LandingHomeViewController")
        let homeNavController = UINavigationController(rootViewController: homeViewController)
        
        
        //overview page
        let browseViewStoryboard = UIStoryboard(name: "BrowseView", bundle: nil)
        let browseViewController = browseViewStoryboard.instantiateViewController(withIdentifier: "BrowseViewController")
        let browseviewNavController = UINavigationController(rootViewController: browseViewController)
        
        let tabbarViewControllers = [homeNavController, browseviewNavController]

        //adding views to tabbar
        self.setViewControllers(tabbarViewControllers, animated: true)
        self.selectedViewController = homeNavController
        
    }

}
