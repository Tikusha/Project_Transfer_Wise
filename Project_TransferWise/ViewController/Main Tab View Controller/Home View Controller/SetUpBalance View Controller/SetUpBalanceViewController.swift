//
//  SetUpBalanceViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/30/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class SetUpBalanceViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var letsGoButton: UIButton!
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.letsGoButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    // MARK: - IBActions
    @IBAction private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func letsGo() {
        let vc = AboutUserViewController()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
}
