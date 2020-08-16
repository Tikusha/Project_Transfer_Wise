//
//  InviteFriendViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/14/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class InviteFriendViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var inviteViaEmailButton: UIButton!
    @IBOutlet private weak var inviteViaSMSButton: UIButton!
    @IBOutlet private weak var copyLinkButton: UIButton!
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.inviteViaEmailButton.customCorner(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.brandBlue)
        self.inviteViaSMSButton.customCorner(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.brandBlue)
        self.copyLinkButton.customCorner(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.brandBlue)
    }
    
    // MARK: - IBActions
    @IBAction private func close(){
        self.dismiss(animated: true, completion: nil)
    }
}
