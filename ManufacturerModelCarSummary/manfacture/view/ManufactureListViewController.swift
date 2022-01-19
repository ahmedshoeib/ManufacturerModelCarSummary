//
//  ManfuctureListViewController.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/21/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import CCBottomRefreshControl

protocol ManfuctureListViewProtocol : BaseView {
    func reloadTableView()
    func showError(title:String, message:String)
}

class ManfuctureListViewController: BaseViewController,ManfuctureListViewProtocol {
    
    lazy var presenter : ManufactureListPresenter = {
        let presenter = ManufactureListPresenter(manfuctureListView: self)
        return presenter
    }()
    
    @IBOutlet weak var manufactureTableView: UITableView!
    
    var refreshControl:UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.manufactureTableView.estimatedRowHeight = 50
        self.manufactureTableView.rowHeight = UITableView.automaticDimension
        
        initPagingSpinner()
        
        self.presenter.getAllManfacureList()
    }
    
    // MARK: - Init and handling UIRefreshControl target
    
    func initPagingSpinner() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshList), for: UIControl.Event.valueChanged)
        self.manufactureTableView.bottomRefreshControl = refreshControl
    }
    
    @objc func refreshList() {
        self.presenter.getAllManfacureList()
    }
    
    // MARK: - View Protocol Delegates
    
    func reloadTableView() {
        self.refreshControl.endRefreshing()
        self.manufactureTableView.reloadData()
    }
    
    func showError(title:String, message:String) {
        self.refreshControl.endRefreshing()
        self.showAlert(title: title, message: message)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoMainType" {
            if let vc = segue.destination as? MainTypesListViewController {
                
                let key = Array(self.presenter.data.keys)[                (self.manufactureTableView.indexPathForSelectedRow?.row)!]
                let value = self.presenter.data[key]
                
                vc.selectedManufacture = value
                vc.selectedManufactureKey = key
            }
        }
    }
    
}
