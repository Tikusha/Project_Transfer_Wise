//
//  AboutUserViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 9/17/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var firstnameTextfield: UITextField!
    @IBOutlet private weak var lastnameTextfield: UITextField!
    @IBOutlet private weak var addressTextfield: UITextField!
    @IBOutlet private weak var cityTextfield: UITextField!
    @IBOutlet private weak var postCodeTextfield: UITextField!
    @IBOutlet private weak var dayTextfield: UITextField!
    @IBOutlet private weak var monthTextfield: UITextField!
    @IBOutlet private weak var yearTextfield: UITextField!
    @IBOutlet private weak var firstnameLineView: UIView!
    @IBOutlet private weak var lastnameLineView: UIView!
    @IBOutlet private weak var addressLineView: UIView!
    @IBOutlet private weak var cityLineView: UIView!
    @IBOutlet private weak var postCodeLineView: UIView!
    @IBOutlet private weak var dayLineView: UIView!
    @IBOutlet private weak var monthLineView: UIView!
    @IBOutlet private weak var yearLineView: UIView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var saveButton: UIButton!
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        self.changeLineColors()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.firstnameTextfield.attributedPlaceholder = NSAttributedString(string: "First name", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.lastnameTextfield.attributedPlaceholder = NSAttributedString(string: "Last name", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.addressTextfield.attributedPlaceholder = NSAttributedString(string: "Address", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.cityTextfield.attributedPlaceholder = NSAttributedString(string: "City", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.postCodeTextfield.attributedPlaceholder = NSAttributedString(string: "Post code", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.dayTextfield.attributedPlaceholder = NSAttributedString(string: "DD", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.monthTextfield.attributedPlaceholder = NSAttributedString(string: "MM", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.yearTextfield.attributedPlaceholder = NSAttributedString(string: "YYYY", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.disabledGrey])
        self.saveButton.customCornerButton(cornerRadius: 3, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        self.firstnameTextfield.delegate = self
        self.lastnameTextfield.delegate = self
        self.addressTextfield.delegate = self
        self.cityTextfield.delegate = self
        self.postCodeTextfield.delegate = self
    }
    
    private func colors() {
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
    }
    
    // MARK: - IBActions
    @IBAction private func chandeColorFirstname() {
        self.firstnameLineView.backgroundColor = Constants.Color.brandBlue
        
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
    }
    
    @IBAction private func chandeColorLastname() {
        self.lastnameLineView.backgroundColor = Constants.Color.brandBlue
        
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
    }
    
    @IBAction private func chandeColorAddress() {
        self.addressLineView.backgroundColor = Constants.Color.brandBlue
        
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
    }
    
    @IBAction private func chandeColorCity() {
        self.cityLineView.backgroundColor = Constants.Color.brandBlue
        
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
    }
    
    @IBAction private func chandeColorPostCode() {
        self.postCodeLineView.backgroundColor = Constants.Color.brandBlue
        
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
    }
    
    @IBAction private func chandeColorDay() {
        self.dayLineView.backgroundColor = Constants.Color.brandBlue
        self.dateLabel.textColor = Constants.Color.brandBlue
        
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
    }
    
    @IBAction private func chandeColorMonth() {
        self.monthLineView.backgroundColor = Constants.Color.brandBlue
        self.dateLabel.textColor = Constants.Color.brandBlue
        
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
    }
    
    @IBAction private func chandeColorYear() {
        self.yearLineView.backgroundColor = Constants.Color.brandBlue
        self.dateLabel.textColor = Constants.Color.brandBlue
        
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
    }
    
    @IBAction private func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func save() {
        if self.firstnameTextfield.text == "" ||
            self.lastnameTextfield.text == "" ||
            self.addressTextfield.text == "" ||
            self.cityTextfield.text == "" ||
            self.postCodeTextfield.text == "" ||
            self.dayTextfield.text == "" ||
            self.monthTextfield.text == "" ||
            self.yearTextfield.text == "" {
            let alert = UIAlertController(title: "Check your details", message: "Please check that all fields are filled in.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Save", message: "Your data is saved.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension AboutUserViewController {
    func changeLineColors() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.changeColor)))
    }
    
    @objc func changeColor(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.view.endEditing(true)
        }
        sender.cancelsTouchesInView = false
        self.firstnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.lastnameLineView.backgroundColor = Constants.Color.keylineGrey
        self.addressLineView.backgroundColor = Constants.Color.keylineGrey
        self.cityLineView.backgroundColor = Constants.Color.keylineGrey
        self.postCodeLineView.backgroundColor = Constants.Color.keylineGrey
        self.dayLineView.backgroundColor = Constants.Color.keylineGrey
        self.monthLineView.backgroundColor = Constants.Color.keylineGrey
        self.yearLineView.backgroundColor = Constants.Color.keylineGrey
        self.dateLabel.textColor = Constants.Color.disabledGrey
    }
}

extension AboutUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.firstnameTextfield:
            self.lastnameTextfield.becomeFirstResponder()
        case self.lastnameTextfield:
            self.addressTextfield.becomeFirstResponder()
        case self.addressTextfield:
            self.cityTextfield.becomeFirstResponder()
        case self.cityTextfield:
            self.postCodeTextfield.becomeFirstResponder()
        case self.postCodeTextfield:
            self.dayTextfield.becomeFirstResponder()
        default:
            self.dayTextfield.resignFirstResponder()
        }
        return true
    }
}
