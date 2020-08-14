//
//  RecipientViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/1/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class RecipientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    // MARK: - IBActions
    @IBAction private func add() {
        self.present(AddRecipientViewController(), animated: true)
    }
}
