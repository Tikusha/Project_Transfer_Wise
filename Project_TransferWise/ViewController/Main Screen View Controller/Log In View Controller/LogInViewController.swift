//
//  LogInViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/11/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var logInButton: UIButton!
    @IBOutlet private weak var appleButton: UIButton!
    @IBOutlet private weak var faceButton: UIButton!
    @IBOutlet private weak var googleButton: UIButton!
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var mailLabel: UILabel!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var lineTopView: UIView!
    @IBOutlet private weak var lineBottomView: UIView!

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        self.dismissKeyboard()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.logInButton.customCorner(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        self.appleButton.customCorner(cornerRadius: 3, borderWidth: 0.7, borderColor: .black)
        self.faceButton.customCorner(cornerRadius: 3, borderWidth: 0.7, borderColor: Constants.Color.navyDark)
        self.googleButton.customCorner(cornerRadius: 3, borderWidth: 0.7, borderColor: Constants.Color.blueDown)
        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "Your email", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.mailLabel.isHidden = true
        self.passwordLabel.isHidden = true
    }
    
    // MARK: - IBActions
    @IBAction private func logIn(_ sender: Any) {
        let vc = MainTabViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction private func chandeColorMail() {
        self.lineTopView.backgroundColor = .red
        print("lll")
    }
    
    @IBAction private func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
