//
//  SearchTableViewController.swift
//  NilpeterSalesApp
//
//  Created by Yuttanant Suwansiri on 9/3/2558 BE.
//  Copyright (c) 2558 Arm Suwansiri. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    let appleProducts = ["Mac","Apple 5","iPhone","Apple Watch","iPad","Apple2","Apple3"]
    var filteredAppleProducts = [String]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active)
        {
            return self.filteredAppleProducts.count
        }
        else
        {
            return self.appleProducts.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? UITableViewCell
        
        if (self.resultSearchController.active)
        {
            cell!.textLabel?.text = self.filteredAppleProducts[indexPath.row]
            
            return cell!
        }
        else
        {
            cell!.textLabel?.text = self.appleProducts[indexPath.row]
            
            return cell!
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var apple = ""
        
        if (self.resultSearchController.active) {
            apple = self.filteredAppleProducts[indexPath.row]
            println("call")
        } else {
            println("nocall")
            apple = self.appleProducts[indexPath.row]
        }
        
        println("result \(self.resultSearchController.active) , index row = \(indexPath.row), apple = \(apple), filter = \(filteredAppleProducts), appleprods = \(appleProducts)")
        
        
    }
    
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        self.filteredAppleProducts.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (self.appleProducts as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredAppleProducts = array as! [String]
        //println(self.filteredAppleProducts)
        self.tableView.reloadData()
    }
    
}
