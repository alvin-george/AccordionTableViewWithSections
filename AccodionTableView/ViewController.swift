//
//  ViewController.swift
//  AccodionTableView
//
//  Created by Alvin on 22/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var accordionTableView: UITableView!
    
    var sectionTitleArray:[String]!
    var subsectionTitleArray:[String]!
    var selectedSection:Int!
    
    var expandedItemList: [Int] = []
    var accordionButtonStatus:Bool =  false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.addInitialUIChanges()
    }
    func addInitialUIChanges()
    {
        updateArrays()
        
        self.automaticallyAdjustsScrollViewInsets =  false
        self.navigationController?.navigationBar.isHidden =  true
        
    }
    func updateArrays()
    {
        sectionTitleArray = ["Subject 1","Subject 2","Subject 3","Subject 4","Subject 5","Subject 6","Subject 7","Subject 8"]
        
        subsectionTitleArray = ["Monday","TuesDay","WednessDay"]
        expandedItemList = []
        
    }
    
    //Accordion TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "sectionTableCell") as! SectionTableCell
        headerCell.accordionTitle.text =  sectionTitleArray[section]
        headerCell.accordionButton.tag =  section
        
        headerCell.accordionButton.addTarget(self, action: #selector(ViewController.accordionButtonClicked(_:)), for: UIControlEvents.touchUpInside)
        
        headerView.addSubview(headerCell)
        
        if(expandedItemList.contains(section))
        {
            print("contain section")
            
            UIView.animate(withDuration: 0.3, delay: 1.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                headerCell.accordionImageView.image =  UIImage(named: "accordion_minus")
            }, completion: nil)
        }
        else{
            print("contain no section")
            UIView.animate(withDuration: 0.3, delay: 1.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                headerCell.accordionImageView.image =  UIImage(named: "accordion_plus")
            }, completion: nil)
        }
        
        return headerView
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(expandedItemList.isEmpty)
        {
            //print("list emnpty")
        }
        else{
            
            // print("list not empty")
            
            for i in 0..<expandedItemList.count{
                
                if(expandedItemList[i] == section)
                {
                    i == expandedItemList.count
                    return subsectionTitleArray.count
                }
            }
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:SubSectionTableCell = tableView.dequeueReusableCell(withIdentifier: "subSectionTableCell")! as! SubSectionTableCell
        
        cell.subsectionTitleLabel.text = subsectionTitleArray[indexPath.row]
        
        return cell
        
    }
    func accordionButtonClicked(_ sender : UIButton)
    {
        selectedSection =  sender.tag
        
        
        if (expandedItemList.contains(selectedSection)){
            
            //remving from unknown index
            if let index = expandedItemList.index(of: selectedSection) {
                expandedItemList.remove(at: index)
            }
        }
        else{
            //expandedItemList.append(selectedSection)
            
            if (expandedItemList.isEmpty){
                expandedItemList.insert(selectedSection, at: 0)
                
            }
            else{
                expandedItemList.append(selectedSection)
            }
        }
        print("expandedItemList : \(expandedItemList)")
        
        accordionTableView.reloadData()
        
        UIView.animate(withDuration: 0.3, delay: 1.0, options: UIViewAnimationOptions.transitionCrossDissolve , animations: {
            self.accordionTableView.reloadData()
        }, completion: nil)
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

