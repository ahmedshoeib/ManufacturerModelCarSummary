//
//  MainTypesListViewController.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/22/18.
//  Copyright © 2018 Test. All rights reserved.
//


import UIKit
import CCBottomRefreshControl

protocol MainTypesListViewProtocol : BaseView {
    func reloadTableView()
    func showError(title:String, message:String)
}

class MainTypesListViewController: BaseViewController,MainTypesListViewProtocol {
    
    var selectedManufacture:String?
    var selectedManufactureKey:String?
    
    lazy var presenter : MainTypesPresenter = {
        let presenter = MainTypesPresenter(mainTypesListView: self)
        return presenter
    }()
    
    @IBOutlet weak var mainTypesTableView: UITableView!
    
    var refreshControl:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = selectedManufacture
        
        self.mainTypesTableView.estimatedRowHeight = 50
        self.mainTypesTableView.rowHeight = UITableView.automaticDimension
        
        initPagingSpinner()
        
        self.presenter.getAllMainTypes(selectedManufactureKey: selectedManufactureKey ?? "")
    }
    
    // MARK: - Init and handling UIRefreshControl target
    
    func initPagingSpinner() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshList), for: UIControl.Event.valueChanged)
        self.mainTypesTableView.bottomRefreshControl = refreshControl
    }
    
    @objc func refreshList() {
        self.presenter.getAllMainTypes(selectedManufactureKey: selectedManufactureKey ?? "")
    }
    
    // MARK: - View Protocol Delegates
    
    func reloadTableView() {
        self.refreshControl.endRefreshing()
        self.mainTypesTableView.reloadData()
    }
    
    func showError(title:String, message:String) {
        self.refreshControl.endRefreshing()
        self.showAlert(title: title, message: message)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}
