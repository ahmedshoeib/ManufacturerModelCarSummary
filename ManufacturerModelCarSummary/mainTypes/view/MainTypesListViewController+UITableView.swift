//
//  MainTypesListViewController+UITableView.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/22/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

extension MainTypesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.keys.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTypeTableViewCell", for: indexPath) as! MainTypeTableViewCell
        
        let key = Array(presenter.data.keys)[indexPath.row]
        let value = presenter.data[key]
        
        cell.mainTypeLabel.text = value
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGray
            cell.mainTypeLabel.textColor = UIColor.white
        }else {
            cell.backgroundColor = UIColor.white
            cell.mainTypeLabel.textColor = UIColor.black
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let key = Array(presenter.data.keys)[indexPath.row]
        let value = presenter.data[key]
        
        guard let selectedModel = value , let selectedManufacture = selectedManufacture else {
            
            self.showAlert(title: Localization.getStringByKey(key: "Sorry"), message: "Something went wrong")
            
            return
        }
        self.showAlert(title: Localization.getStringByKey(key: "Congratulations"), message: "you have seleced manafacture \(selectedManufacture) and model is \(selectedModel)")
    }
}
