//
//  MasterViewController.swift
//  CandySearch
//
//  Created by  汪刚 on 2018/9/16.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var detaiViewController : DetailViewController? = nil
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    let searchViewController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candies = [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear")
        ]
        setSearchController()
    
        
    }

    func setSearchController()  {
        searchViewController.searchResultsUpdater = self as UISearchResultsUpdating
        searchViewController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchViewController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchViewController.searchBar.delegate = self
        if #available(iOS 11, *) {
            self.navigationItem.searchController = searchViewController
            self.navigationItem.searchController?.isActive = true
            self.navigationItem.hidesSearchBarWhenScrolling = false
        }else {
            tableView.tableHeaderView = searchViewController.searchBar
        }
        
        
    }
    
    func filterContentSearchText(_ searchText:String,scope:String = "ALL"){
        filteredCandies = candies.filter{ candy in
            if !(candy.category == scope) &&  scope != "All"{
                return false
            }
            
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    //MARK: - table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchViewController.isActive {
            return filteredCandies.count
        }
        return candies.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let candy: Candy
                if searchViewController.isActive {
                    candy = filteredCandies[(indexPath as NSIndexPath).row]
                }else {
                    candy = candies[(indexPath as NSIndexPath).row]
                }
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailCandy = candy
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let  candy :Candy
        if searchViewController.isActive {
            candy = filteredCandies[(indexPath as NSIndexPath).row]
        }else {
            candy = candies[(indexPath as NSIndexPath).row]
        }
        cell.textLabel!.text = candy.name
        cell.detailTextLabel?.text = candy.category
        return cell
    }
 

}


extension MasterViewController :UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchViewController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentSearchText(searchController.searchBar.text!,scope: scope)
    }
}


extension MasterViewController :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
