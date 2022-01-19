//
//  ManufactureListPresenter.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/21/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class ManufactureListPresenter: NSObject {
    
    let pageSize = 50
    var page:Int = 0
    
    weak var manfuctureListView:ManfuctureListViewProtocol?
    
    var data:[String:String] = [:]
    
    var allMainTypesUrl : String {
        get { return "car-types/manufacturer?page=\(self.page)&pageSize=\(self.pageSize)&wa_key=coding-puzzle-client-449cc9d";}
    }

    weak var service: Service?
    
    init(service: Service = Service.shared,manfuctureListView:ManfuctureListViewProtocol) {
        self.service = service
        self.manfuctureListView = manfuctureListView
    }
    
    func getAllManfacureList() {
        
        guard let serviceCall = service else {
            self.manfuctureListView?.showError(title: "Error", message: "Missing service")
            return
        }
        
        let firstPage = page == 0
        if  firstPage {
            self.manfuctureListView?.showBlockingLoading(showLoading: true)
        }
        
        serviceCall.call(urlString:allMainTypesUrl , requestMethod: .get, parameters: nil,responseModel:ManufactureListModel.self ) { [weak self] result in
            
            if firstPage {
                self?.manfuctureListView?.showBlockingLoading(showLoading: false)
            }
            
            switch result {
            case .success(let responseModel) :
                
                if  responseModel.wkda != nil && (responseModel.wkda?.count)! == 0 {
                    self?.manfuctureListView?.showError(title:Localization.getStringByKey(key: "Notice!"), message: Localization.getStringByKey(key:"No Data Found"))
                    return
                }
                
                self?.page += 1
                self?.data.merge(with: responseModel.wkda!)
                self?.manfuctureListView?.reloadTableView()
                
                break
            case .failure(let error) :
                switch error {
                case .network( _):
                    self?.manfuctureListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key: "No Internet Connection"))
                case .parser( _):
                    self?.manfuctureListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key:"Un Expected Error"))
                case .error( _):
                    self?.manfuctureListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key:"Un Expected Error"))
                case .serviceError( _):
                    self?.manfuctureListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key:"Un Expected Error"))
                case .empty( _):
                    self?.manfuctureListView?.showError(title: Localization.getStringByKey(key: "Notice!"), message: Localization.getStringByKey(key:"No Data Found"))
                }
                break
            }
        }
    }
}
