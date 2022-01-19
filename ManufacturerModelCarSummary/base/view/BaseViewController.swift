//
//  BaseViewController.swift
//  ManufacturerModelCarSummary
//
//  Created by Shoeib on 10/21/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import JGProgressHUD

protocol BaseView : class {
    func showBlockingLoading(showLoading:Bool)
}

class BaseViewController: UIViewController {

    var hud:JGProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - handling progress hud by showing and hiding
    
    private func showLoadingHUD() {
        hud = JGProgressHUD(style: .light)
        hud!.textLabel.text = "Loading"
        hud!.show(in: self.view)
    }

    private func hideLoadingHUD() {
        if let hud = hud {
            hud.dismiss()
        }
    }
    
    func showHideLoading(showLoading:Bool) {
        if showLoading {
            showLoadingHUD()
        }else{
            hideLoadingHUD()
        }
    }
    
    // MARK: - showing alerts for success and error mesasages

    func showAlert(title:String,message:String) {
        let alertController = UIAlertController(title: title, message:message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(OKAction)

        self.present(alertController, animated: true, completion: nil)

    }
    
    // MARK: - Base View Delegates
    
    func showBlockingLoading(showLoading: Bool) {
        self.showHideLoading(showLoading: showLoading)
    }
}
