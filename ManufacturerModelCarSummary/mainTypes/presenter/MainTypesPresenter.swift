//
//  MainTypesListViewModel.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/22/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

class MainTypesPresenter: NSObject {
    
    let pageSize = 50
    var page:Int = 0
    
    weak var mainTypesListView:MainTypesListViewProtocol?
    
    var data:[String:String] = [:]
    
    weak var service: Service?
    
    var selectedManufactureKey:String?
    
    var allMainTypesUrl : String {
        get { return "car-types/main-types?manufacturer=\(selectedManufactureKey ?? "")&page=\(page)&pageSize=\(pageSize)&wa_key=coding-puzzle-client-449cc9d"}
    }
    
    init(service: Service = Service.shared,mainTypesListView:MainTypesListViewProtocol) {
        self.service = service
        self.mainTypesListView = mainTypesListView
    }
    
    func getAllMainTypes(selectedManufactureKey:String) {
        
        self.selectedManufactureKey = selectedManufactureKey
        
        guard let serviceCall = service else {
            self.mainTypesListView?.showError(title: "Error", message: "Missing service")
            return
        }
        
        let firstPage = page == 0
        if  firstPage {
            self.mainTypesListView?.showBlockingLoading(showLoading: true)
        }
        
        serviceCall.call(urlString: allMainTypesUrl, requestMethod: .get, parameters: nil,responseModel:MainTypesModel.self ) { [weak self] result in
            
            if firstPage {
                self?.mainTypesListView?.showBlockingLoading(showLoading: false)
            }
            
            switch result {
            case .success(let responseModel) :
                
                if  responseModel.wkda.count == 0 {
                    self?.mainTypesListView?.showError(title:Localization.getStringByKey(key: "Notice!"), message: Localization.getStringByKey(key:"No Data Found"))
                    return
                }
                
                self?.page += 1
                self?.data.merge(with: responseModel.wkda)
                self?.mainTypesListView?.reloadTableView()
                
                break
            case .failure(let error) :
                switch error {
                case .network( _):
                    self?.mainTypesListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key: "No Internet Connection"))
                case .parser( _):
                    self?.mainTypesListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key:"Un Expected Error"))
                case .error( _):
                    self?.mainTypesListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key:"Un Expected Error"))
                case .serviceError( _):
                    self?.mainTypesListView?.showError(title: Localization.getStringByKey(key: "Error"), message: Localization.getStringByKey(key:"Un Expected Error"))
                case .empty( _):
                    self?.mainTypesListView?.showError(title: Localization.getStringByKey(key: "Notice!"), message: Localization.getStringByKey(key:"No Data Found"))
                }
                break
            }
        }
    }
}
