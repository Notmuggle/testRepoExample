//
//  LandingHomeViewController.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit
import SDWebImage

class LandingHomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    let responseBuilder: ResponseBuilder = ResponseBuilder()
    var homeData: HomeDataModal?

    let cellNameList: [String] = ["TitleTableViewCell", "SectionHeaderTableCell", "ActivityTableViewCell", "StepsTableViewCell", "AllHealthTableCell", "InfoTableViewCell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        updateData()
        setTableDelegates()
        registerCells()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setNavigation()
        super.viewDidAppear(animated)
    }
    
    func setTableDelegates(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    func setNavigation(){
//        self.navigationController?.hidesBarsOnTap = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        self.view.backgroundColor = UIColor.init(red: 66/255, green: 66/255, blue: 66/255, alpha: 0.20)
    }
    
    func registerCells(){
        if cellNameList.count > 0{
                     for cellName in cellNameList{
        homeTableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
              }
          }
    }
    
    func updateData(){
        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
        dispatchQueue.async{
            self.responseBuilder.getHomeData(){(movieList, status) in
                if let homeDataList:HomeDataModal = movieList, status{
                    self.homeData = homeDataList
                    DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                    }
                }
            }
        }
        
        
    }

}

extension LandingHomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
        
        let cell: TitleTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? TitleTableViewCell
            cell.titleLabel.text = "Summary"
        return cell
        }else if indexPath.section == 1{
            let cell: SectionHeaderTableCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? SectionHeaderTableCell
            cell.sectionHeaderLabel.text = "Favourites"
            return cell
        }else if indexPath.section == 2{
//            ActivityTableViewCell
            let cell: ActivityTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? ActivityTableViewCell
            
            if let homeDataList: HomeDataModal = self.homeData{
                cell.moveValLabel.text = "\(homeDataList.activity?.items?.move ?? 0)"
                cell.exerValLabel.text = "\(homeDataList.activity?.items?.exercise ?? 0)"
                cell.standValLabel.text = "\(homeDataList.activity?.items?.stand ?? 0)"
                
                cell.titleImage.sd_setImage(with: URL(string: homeDataList.activity?.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                
                cell.moveValSILabel.text = "cal"
                cell.exerSIValLabel.text = "min"
                cell.standSiLabel.text = "hrs"
            }
            
            return cell
        }else if indexPath.section == 3{
            let cell: StepsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? StepsTableViewCell
            
            if let homeDataList: HomeDataModal = self.homeData{
                cell.stepTitleLabel.text = homeDataList.steps?.name
                cell.numberOfStepsLabel.text = "\(homeDataList.steps?.value ?? 0)"
                cell.stepsSiLabel.text = "steps"
                cell.stepTitleLabel.textColor = UIColor.orange
                
                cell.stepImage.sd_setImage(with: URL(string: homeDataList.steps?.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            }
            return cell
        }else if indexPath.section == 4{
             let cell: AllHealthTableCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? AllHealthTableCell
            
            return cell
        }else{
            let cell: InfoTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? InfoTableViewCell
            if let homeDataList: HomeDataModal = self.homeData{
                            
                cell.titleLabel.text = "Get More From Health"
                cell.headerLabel.text = homeDataList.articles?.first?.heading
                cell.captionLabel.text = homeDataList.articles?.first?.subheading
                
                cell.customimageView.sd_setImage(with: URL(string: homeDataList.articles?.first?.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                
            }
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == IndexPath(row: 0, section: 4){
            let detailsViewController: DetailsViewController = DetailsViewController.instantiateFromStoryboard()
            if let homeDataList: HomeDataModal = homeData{
                detailsViewController.activityData = homeDataList.activity
            }
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }else if indexPath == IndexPath(row: 0, section: 5){
            
            let webVC: WebViewViewController = WebViewViewController.instantiateFromStoryboard()
            self.present(webVC, animated: true, completion: nil)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 100
        }else if indexPath.section == 1{
            return 35
        }else if indexPath.section == 2{
            return 120
        }else if indexPath.section == 3{
            return 80
        }
        else if indexPath.section == 4{
            return 60
        }
        else{
            return 345
        }
    }
    
    
    
}
