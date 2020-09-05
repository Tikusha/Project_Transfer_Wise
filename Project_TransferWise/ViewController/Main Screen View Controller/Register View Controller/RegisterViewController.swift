//
//  RegisterViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/23/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var eyeImage: UIImageView!
    @IBOutlet private weak var passwordLineView: UIView!
    @IBOutlet private weak var emailLineView: UIView!

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "Your email", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Choose a password", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.eyeImage.isHidden = true
    }
    
    // MARK: - IBActions
    @IBAction private func chandeColorMail() {
        self.emailLineView.backgroundColor = Constants.Color.brandBlue
        self.passwordLineView.backgroundColor = Constants.Color.keylineGrey
        self.eyeImage.isHidden = true
    }
    
    @IBAction private func chandeColorPassword() {
        self.eyeImage.isHidden = false
        self.passwordLineView.backgroundColor = Constants.Color.brandBlue
        self.emailLineView.backgroundColor = Constants.Color.keylineGrey
    }
    
    @IBAction private func register(_ sender: Any) {
        guard let email = self.emailTextfield.text?.isNotEmpty,
            let password = self.passwordTextfield.text?.isNotEmpty else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error == nil {
                print("Register")
                let vc = MainTabViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction private func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension String {
    var isNotEmpty: String? {
        if self.isEmpty { return nil }
        return self
    }
}
