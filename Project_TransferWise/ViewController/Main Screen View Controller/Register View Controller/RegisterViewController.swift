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
    @IBOutlet private weak var registerButton: UIButton!
    
    // MARK: - Properties
    var alert = UIAlertController()

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
        self.configuration()
        self.changeLineColors()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "Your email", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Choose a password", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.registerButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        self.eyeImage.isHidden = true
        self.passwordTextfield.delegate = self
        self.emailTextfield.delegate = self
    }
    
    private func showAlert() {
        self.alert = UIAlertController(title: "Can't save", message: "Please fill in all fields", preferredStyle: UIAlertController.Style.alert)
        present(self.alert, animated: true)
    }
    
    private func dismissAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.alert.dismiss(animated: true, completion: nil)
        })
    }
    
    private func alertPasword() {
        self.alert = UIAlertController(title: "Info", message: "Password must be more than 8", preferredStyle: UIAlertController.Style.alert)
        present(self.alert, animated: true)
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
    
    @IBAction private func register() {
        guard let email = self.emailTextfield.text?.isNotEmpty,
            let password = self.passwordTextfield.text?.isNotEmpty else {
            self.showAlert()
            self.dismissAlert()
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error == nil {
                print("Register")
                let vc = MainTabViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                self.alertPasword()
                self.dismissAlert()
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

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.emailTextfield:
            self.passwordTextfield.becomeFirstResponder()
        default:
            self.passwordTextfield.resignFirstResponder()
            self.register()
        }
        return true
    }
}

extension RegisterViewController {
    func changeLineColors() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.changeColor)))
    }
    
    @objc func changeColor(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.view.endEditing(true)
        }
        sender.cancelsTouchesInView = false
        self.eyeImage.isHidden = true
        self.emailLineView.backgroundColor = Constants.Color.keylineGrey
        self.passwordLineView.backgroundColor = Constants.Color.keylineGrey
    }
}
