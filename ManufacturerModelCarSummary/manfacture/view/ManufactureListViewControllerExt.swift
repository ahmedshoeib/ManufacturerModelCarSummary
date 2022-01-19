//
//  ManfuctureListViewControllerExt.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/21/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

extension ManfuctureListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.keys.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManufactureTableViewCell", for: indexPath) as! ManufactureTableViewCell
  
        let key = Array(presenter.data.keys)[indexPath.row]
        let value = presenter.data[key]

        cell.manufactureLabel.text = value

        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGray
            cell.manufactureLabel.textColor = UIColor.white
        }else {
            cell.backgroundColor = UIColor.white
            cell.manufactureLabel.textColor = UIColor.black
        }
        
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "gotoMainType", sender: self)
    }
}
