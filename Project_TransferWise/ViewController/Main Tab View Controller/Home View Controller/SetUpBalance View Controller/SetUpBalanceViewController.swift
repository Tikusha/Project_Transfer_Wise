//
//  SetUpBalanceViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/30/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class SetUpBalanceViewController: UIViewController {
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
    }
    
    // MARK: - IBActions
    @IBAction private func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func letsGo(){
        print("Lets go")
    }
}
