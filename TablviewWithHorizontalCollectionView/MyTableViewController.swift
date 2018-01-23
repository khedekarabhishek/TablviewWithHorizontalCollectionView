//
//  MyTableViewController.swift
//  TableviewWithMultipleControllers
//
//  Created by Abhishek Khedekar on 09/01/18.
//  Copyright © 2018 Abhishek Khedekar. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 170
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "YearsAndMonthsTableViewCell") as! YearsAndMonthsTableViewCell
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownTableViewCell") as! DropDownTableViewCell
                cell.contentView.backgroundColor = UIColor.green
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? YearsAndMonthsTableViewCell else { return }

        tableViewCell.reloadYearsCollectionView = true
        tableViewCell.collectionViewYears.tag = collectionViewTags.tagCollectionViewYears.rawValue
        tableViewCell.collectionViewYears.reloadData()
        
        tableViewCell.collectionViewYears.performBatchUpdates({
        }, completion: { (completed) in
            
            tableViewCell.reloadYearsCollectionView = false
            tableViewCell.reloadMonthsCollectionView = true
            tableViewCell.collectionViewMonths.tag = collectionViewTags.tagCollectionViewMonths.rawValue
            tableViewCell.collectionViewMonths.reloadData()
            
        })

    }

}
