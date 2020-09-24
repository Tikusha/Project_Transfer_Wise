//
//  BusinessViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 9/22/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var mailTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var IBANTextField: UITextField!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mailLineView: UIView!
    @IBOutlet private weak var holderNameLineView: UIView!
    @IBOutlet private weak var IBANLineView: UIView!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var currencyImage: UIImageView!
    @IBOutlet private weak var countryLabel: UILabel!
    
    // MARK: - Properties
    var name: String?
    private var alert = UIAlertController()
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        self.dismissKeyboard()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.titleLabel.text = name
        self.mailTextField.delegate = self
        self.nameTextField.delegate = self
        self.IBANTextField.delegate = self
        self.mailTextField.attributedPlaceholder = NSAttributedString(string: "Recient's email (optional)", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.nameTextField.attributedPlaceholder = NSAttributedString(string: "Your Name of business / charity", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.IBANTextField.attributedPlaceholder = NSAttributedString(string: "IBAN", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.addButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    private func emptyFieldsAlert() {
        self.alert = UIAlertController(title: "Can't save", message: "Please fill in all fields", preferredStyle: UIAlertController.Style.alert)
        present(alert, animated: true)
    }
    
    private func addDataAlert() {
        self.alert = UIAlertController(title: "Add", message: "Added your data", preferredStyle: UIAlertController.Style.alert)
        present(alert, animated: true)
    }
    
    private func dismissAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.alert.dismiss(animated: true, completion: nil)
        })
    }
    
    // MARK: - IBActions
    @IBAction private func currency() {
        let vc = CountryViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func add() {
        if self.mailTextField.text == "" ||
            self.nameTextField.text == "" ||
            self.IBANTextField.text == "" {
            self.emptyFieldsAlert()
            self.dismissAlert()
        } else {
            self.addDataAlert()
            self.dismissAlert()
        }
    }
}

extension BusinessViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.mailTextField:
            self.nameTextField.becomeFirstResponder()
        case self.nameTextField:
            self.IBANTextField.becomeFirstResponder()
        default:
            self.IBANTextField.resignFirstResponder()
        }
        return true
    }
}

extension BusinessViewController: SetCountryCodeDelegate {
    func setCountryCode(image: UIImage, code: String, country: String) {
        self.currencyImage.image = image
        self.countryLabel.text = "\(code) - \(country)"
    }
}


