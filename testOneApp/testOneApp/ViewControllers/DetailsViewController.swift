//
//  DetailsViewController.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    
    
    let responseBuilder: ResponseBuilder = ResponseBuilder()
    var allDataList: AllDataModel?
    var activityData: HomeActivity?
    let cellNameList: [String] = ["TitleTableViewCell", "SectionHeaderTableCell", "ActivityTableViewCell", "StepsTableViewCell"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        setTableDelegates()
        registerCells()
        setNavigation()
        // Do any additional setup after loading the view.
    }
    
    class func instantiateFromStoryboard() -> DetailsViewController {
           let storyboard = UIStoryboard(name: "DetailsView", bundle: nil)
           let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! DetailsViewController
           return viewController
       }
    
    func setTableDelegates(){
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
    }
    
    func setNavigation(){
        self.navigationController?.hidesBarsOnTap = false
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.leftBarButtonItem?.title = "Settings"
    }
    
    func registerCells(){
        if cellNameList.count > 0{
                     for cellName in cellNameList{
        detailsTableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
              }
          }
    }
    
    func updateData(){
        let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
        dispatchQueue.async{
            self.responseBuilder.getAllData(){(allDataList, status) in
                if let allDataList:AllDataModel = allDataList, status{
                    self.allDataList = allDataList
                    DispatchQueue.main.async {
                    self.detailsTableView.reloadData()
                    }
                }
            }
        }
        
    }

  

}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellNameList.count + 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
                
                let cell: TitleTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? TitleTableViewCell
                    cell.titleLabel.text = "All Health Data"
                return cell
                }else if indexPath.section == 1{
                    let cell: SectionHeaderTableCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? SectionHeaderTableCell
                    cell.sectionHeaderLabel.text = "Today"
                    return cell
                }else if indexPath.section == 2{
        //            ActivityTableViewCell
                    let cell: ActivityTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? ActivityTableViewCell
                    
                    if let activityDataList: HomeActivity = self.activityData{
                        cell.moveValLabel.text = "\(activityDataList.items?.move ?? 0)"
                        cell.exerValLabel.text = "\(activityDataList.items?.exercise ?? 0)"
                        cell.standValLabel.text = "\(activityDataList.items?.stand ?? 0)"
                        
                        cell.titleImage.sd_setImage(with: URL(string: activityDataList.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                        
                        cell.moveValSILabel.text = "cal"
                        cell.exerSIValLabel.text = "min"
                        cell.standSiLabel.text = "hrs"
                    }
                    
                    return cell
                }else if indexPath.section == 3{
                    let cell: StepsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[indexPath.section]) as? StepsTableViewCell
                    
                    if let allDataList: AllDataModel = self.allDataList{
                        cell.stepTitleLabel.text = allDataList.activeEnergy?.name
                        cell.numberOfStepsLabel.text = "\(allDataList.activeEnergy?.value ?? 0)"
                        cell.stepsSiLabel.text = "kcal"
                        cell.stepTitleLabel.textColor = UIColor.orange
                        
                        cell.stepImage.sd_setImage(with: URL(string: allDataList.activeEnergy?.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
                    }
                    return cell
                }
        else if indexPath.section == 4{
                let cell: StepsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[3]) as? StepsTableViewCell
            
            if let allDataList: AllDataModel = self.allDataList{
                cell.stepTitleLabel.text = allDataList.standHours?.name
                cell.numberOfStepsLabel.text = "\(allDataList.standHours?.value ?? 0)"
                cell.stepsSiLabel.text = "hr"
                cell.stepTitleLabel.textColor = UIColor.orange
                
                cell.stepImage.sd_setImage(with: URL(string: allDataList.standHours?.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            }
            
            
            return cell
        }
        else if indexPath.section == 5{
        let cell: StepsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[3]) as? StepsTableViewCell
            
            
            if let allDataList: AllDataModel = self.allDataList{
                cell.stepTitleLabel.text = allDataList.heartRate?.name
                cell.numberOfStepsLabel.text = "\(allDataList.heartRate?.value ?? 0)"
                cell.stepsSiLabel.text = "BPM"
                cell.stepTitleLabel.textColor = UIColor.red
                
                cell.stepImage.sd_setImage(with: URL(string: allDataList.heartRate?.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            }
            
            return cell
        }
        else if indexPath.section == 6{
        let cell: StepsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[3]) as? StepsTableViewCell
            
            
            if let allDataList: AllDataModel = self.allDataList{
                cell.stepTitleLabel.text = allDataList.soundLevels?.name
                cell.numberOfStepsLabel.text = "\(allDataList.soundLevels?.value ?? 0)"
                cell.stepsSiLabel.text = "OK"
                cell.stepTitleLabel.textColor = UIColor.blue
                
                cell.stepImage.sd_setImage(with: URL(string: allDataList.soundLevels?.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            }
            
            
            
            return cell
        }
        else {
        let cell: StepsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellNameList[3]) as? StepsTableViewCell
            
            
            if let allDataList: AllDataModel = self.allDataList{
                cell.stepTitleLabel.text = allDataList.sleepHours?.name
                cell.numberOfStepsLabel.text = "\(allDataList.sleepHours?.hour ?? 0)"
                cell.stepsSiLabel.text = "hrs"
                cell.stepTitleLabel.textColor = UIColor.yellow
                
                cell.stepImage.sd_setImage(with: URL(string: allDataList.sleepHours?.icon ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 100
        }else if indexPath.section == 1{
            return 35
        }else if indexPath.section == 2{
            return 120
        }else{
            return 95
        }
        
    }
    
    
}
