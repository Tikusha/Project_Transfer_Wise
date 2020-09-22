//
//  LogInViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/11/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var logInButton: UIButton!
    @IBOutlet private weak var appleButton: UIButton!
    @IBOutlet private weak var faceButton: UIButton!
    @IBOutlet private weak var googleButton: UIButton!
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var lineTopView: UIView!
    @IBOutlet private weak var lineBottomView: UIView!
    @IBOutlet private weak var eyeButton: UIButton!
    
    // MARK: - Properties
    private var isSecureTextEntryPassword = true
    var alert = UIAlertController()
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        self.dismissKeyboard()
        self.changeLineColors()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.logInButton.customCorner(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        self.appleButton.customCorner(cornerRadius: 3, borderWidth: 0.7, borderColor: .black)
        self.faceButton.customCorner(cornerRadius: 3, borderWidth: 0.7, borderColor: Constants.Color.navyDark)
        self.googleButton.customCorner(cornerRadius: 3, borderWidth: 0.7, borderColor: Constants.Color.blueDown)
        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "Your email", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.eyeButton.isHidden = true
        self.passwordTextfield.delegate = self
        self.emailTextfield.delegate = self
    }
    
    private func showAlert() {
        self.alert = UIAlertController(title: "Info", message: "Please fill in all fields", preferredStyle: UIAlertController.Style.alert)
        present(alert, animated: true)
    }
    
    private func incorrectAlert() {
        self.alert = UIAlertController(title: "Info", message: "Your mail or password is not correct", preferredStyle: UIAlertController.Style.alert)
        present(alert, animated: true)
    }
    
    private func dismissAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            self.alert.dismiss(animated: true, completion: nil)
        })
    }
    
    // MARK: - IBActions
    @IBAction private func logIn() {
        guard let email = self.emailTextfield.text?.isNotEmpty,
              let password = self.passwordTextfield.text?.isNotEmpty else {
            self.showAlert()
            self.dismissAlert()
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if error == nil {
                print("Log In")
                let vc = MainTabViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                self.incorrectAlert()
                self.dismissAlert()
            }
        }
    }
    
    @IBAction private func chandeColorMail() {
        self.lineTopView.backgroundColor = Constants.Color.brandBlue
        self.lineBottomView.backgroundColor = Constants.Color.keylineGrey
        self.eyeButton.isHidden = true
    }
    
    @IBAction private func chandeColorPassword() {
        self.eyeButton.isHidden = false
        self.lineBottomView.backgroundColor = Constants.Color.brandBlue
        self.lineTopView.backgroundColor = Constants.Color.keylineGrey
    }
    
    @IBAction private func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func showPassword(_ sender: Any) {
        if self.isSecureTextEntryPassword {
            self.eyeButton.setImage(UIImage(named: "opened_eye"), for: .normal)
            self.passwordTextfield.isSecureTextEntry = false
            self.isSecureTextEntryPassword = false
        } else {
            self.eyeButton.setImage(UIImage(named: "closed_eye"), for: .normal)
            self.passwordTextfield.isSecureTextEntry = true
            self.isSecureTextEntryPassword = true
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.emailTextfield:
            self.passwordTextfield.becomeFirstResponder()
        default:
            self.passwordTextfield.resignFirstResponder()
            self.logIn()
        }
        return true
    }
}

extension LogInViewController {
    func changeLineColors() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.changeColor)))
    }
    
    @objc func changeColor(sender: UITapGestureRecognizer) {
        if !self.isSecureTextEntryPassword {
            self.view.endEditing(false)
        } else {
            if sender.state == .ended {
                self.view.endEditing(true)
                sender.cancelsTouchesInView = false
                self.eyeButton.isHidden = true
                self.lineBottomView.backgroundColor = Constants.Color.keylineGrey
                self.lineTopView.backgroundColor = Constants.Color.keylineGrey
                
            }
        }
    }
}
