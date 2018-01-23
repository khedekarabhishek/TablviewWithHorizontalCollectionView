//
//  YearsAndMonthsTableViewCell.swift
//  TablviewWithHorizontalCollectionView
//
//  Created by Abhishek Khedekar on 23/01/18.
//  Copyright © 2018 Abhishek Khedekar. All rights reserved.
//

import UIKit

enum collectionViewTags: Int {
    case tagCollectionViewYears = 0
    case tagCollectionViewMonths
}

class YearsAndMonthsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewYears: UICollectionView!
    @IBOutlet weak var collectionViewMonths: UICollectionView!

    var arrYears = [10,10,10,10,10]
    var arrMonths = [20,20,20,20,20]
    
    var reloadYearsCollectionView: Bool = false
    var reloadMonthsCollectionView: Bool = false
    
    var selectedIndexForYear:Int?
    var selectedIndexForMonth:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        collectionViewYears.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
//        collectionViewMonths.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")

//        reloadYearsCollectionView = true
//        collectionViewYears.tag = collectionViewTags.tagCollectionViewYears.rawValue
//        collectionViewYears.reloadData()
//        
//        collectionViewYears.performBatchUpdates({
//        }, completion: { (completed) in
//            
//            self.reloadYearsCollectionView = false
//            self.reloadMonthsCollectionView = true
//            self.collectionViewMonths.tag = collectionViewTags.tagCollectionViewMonths.rawValue
//            self.collectionViewMonths.reloadData()
//            
//        })

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension YearsAndMonthsTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if reloadYearsCollectionView {
            return arrYears.count
        } else {
            return arrMonths.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        if reloadYearsCollectionView {
            let str = String(describing:arrYears[indexPath.row])
            print("str is : \(str)")
            cell.lblYear.text = String(describing:arrYears[indexPath.row])
            if indexPath.row == selectedIndexForYear {
                cell.yearsBackgroundView.backgroundColor = UIColor.blue
            }
        } else {
            cell.lblMonth.text = String(describing:arrMonths[indexPath.row])
            if indexPath.row == selectedIndexForMonth {
                cell.monthsBackgroundView.backgroundColor = UIColor.red
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case collectionViewTags.tagCollectionViewYears.rawValue:
            selectedIndexForYear = indexPath.row
            
            reloadYearsCollectionView = true
            reloadMonthsCollectionView = false
            
            collectionViewYears.reloadItems(at: [indexPath])
            
            print("year is selected : \(arrYears[indexPath.row])")
            print("Index of year is : \(String(describing: selectedIndexForYear))")
        case collectionViewTags.tagCollectionViewMonths.rawValue:
            selectedIndexForMonth = indexPath.row
            
            reloadYearsCollectionView = false
            reloadMonthsCollectionView = true

            collectionViewMonths.reloadItems(at: [indexPath])

            print("month is selected : \(arrMonths[indexPath.row])")
            print("Index of year is : \(String(describing: selectedIndexForMonth))")
        default:
            break
        }
    }
}


extension YearsAndMonthsTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemsPerRow:CGFloat = 4
//        let hardCodedPadding:CGFloat = 5
//        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
//        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
//        print("item size is : \(itemWidth) and \(itemHeight)")
//        print("collectionview size is :\(collectionView.bounds)")
//        return CGSize(width: itemWidth, height: itemHeight)
        return CGSize(width: 10.0, height: 10.0)

    }
    
}


