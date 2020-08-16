//
//  CountryViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/16/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchView: UIView!

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configurarion
    private func configuration() {
        self.searchView.cornerView(cornerRadius: 12, borderWidth: 0.2, borderColor: Constants.Color.navyMid)
        self.searchTextField.placeholder = "sdkmsdlf"
        
    }
    
    // MARK: - IBActions
    @IBAction private func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
