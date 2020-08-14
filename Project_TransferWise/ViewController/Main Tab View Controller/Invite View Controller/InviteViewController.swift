//
//  InviteViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/19/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var inviteFriendButton: UIButton!

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.inviteFriendButton.customCorner(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    // MARK: - IBActions
    @IBAction func inviteFriend() {
        self.present(InviteFriendViewController(), animated: true)
    }
}
