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
    @IBOutlet private weak var emailLabel: UILabel! {
        didSet {
            emailLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var lineTopView: UIView!
    @IBOutlet private weak var lineBottomView: UIView!
    @IBOutlet private weak var eyeImage: UIImageView!
    @IBOutlet private var mailLabelHeightConstraint: NSLayoutConstraint!
    
    private var usernameLabelYAnchorConstraint: NSLayoutConstraint!
    private var usernameLabelLeadingAnchor: NSLayoutConstraint!

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
//        self.emailLabel.isHidden = true
        self.passwordLabel.isHidden = true
        self.eyeImage.isHidden = true
        self.emailTextfield.delegate = self
    }
    
    func configureViews() {
        let margins = self.view.layoutMarginsGuide
//      usernameLabelYAnchorConstraint = usernameLBL.centerYAnchor.constraint(equalTo: usernameTextField.centerYAnchor, constant: 0)
//      usernameLabelLeadingAnchor = usernameLBL.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor, constant: 5)

      NSLayoutConstraint.activate([
        emailTextfield.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
        emailTextfield.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
        emailTextfield.widthAnchor.constraint(equalToConstant: 100),
        emailTextfield.heightAnchor.constraint(equalToConstant: 25),

//        usernameLabelYAnchorConstraint,
//        usernameLabelLeadingAnchor,
        ])
    }
    
    // MARK: - IBActions
    @IBAction private func logIn(_ sender: Any) {
        let vc = MainTabViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction private func chandeColorMail() {
//        self.lineTopView.backgroundColor = Constants.Color.brandBlue
//        self.mailLabel.isHidden = false
////        self.mailLabelHeightConstraint.constant = 30
//        self.passwordLabel.isHidden = true
//        self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "")
//        self.lineBottomView.backgroundColor = Constants.Color.keylineGrey
//        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
//        self.eyeImage.isHidden = true
    }
    
    @IBAction private func chandeColorPassword() {
//        self.passwordLabel.isHidden = false
//        self.mailLabel.isHidden = true
//        self.eyeImage.isHidden = false
//        self.emailTextfield.attributedPlaceholder = NSAttributedString(string: "Your email", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
//        self.lineBottomView.backgroundColor = Constants.Color.brandBlue
//        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "")
//        self.lineTopView.backgroundColor = Constants.Color.keylineGrey
    }
    
    @IBAction private func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LogInViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin")
        let margins = self.view.layoutMarginsGuide
        NSLayoutConstraint.activate([
//                emailLabel.centerXAnchor.constraint(equalToConstant: 10),
//                emailLabel.centerYAnchor.constraint(equalToConstant: 10),
            
                emailLabel.widthAnchor.constraint(equalToConstant: 100),
                emailLabel.heightAnchor.constraint(equalToConstant: 25),

                ])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end")
    }
}
