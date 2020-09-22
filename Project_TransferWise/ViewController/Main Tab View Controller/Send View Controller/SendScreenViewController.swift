//
//  SendScreenViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/26/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class SendScreenViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var priceComparisonButton: UIButton!
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var recipientTextField: UITextField!
    @IBOutlet private weak var sendAmountTextField: UITextField!
    @IBOutlet private weak var currencyFirstLabel: UILabel!
    @IBOutlet private weak var currencySecondLabel: UILabel!
    @IBOutlet private weak var currentFirstImage: UIImageView!
    @IBOutlet private weak var currentSecondImage: UIImageView!
    @IBOutlet private weak var currentFirstButton: UIButton!
    @IBOutlet private weak var currentSecondButton: UIButton!
    
    // MARK: - Properties
    private let fetchRate = FetchCurrency()
    var isTagCurrentFirstButton: Bool = false
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        self.dismissKeyboard()
        self.editingFirstChanged()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.priceComparisonButton.customCorner(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.brandBlue)
        self.topView.cornerView(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
        self.bottomView.cornerView(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
    }
    
    private func moveCountryScreen() {
        let vc = CountryViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func editingFirstChanged() {
        guard let text = self.sendAmountTextField.text else { return }
        if text.isEmpty {
            self.sendAmountTextField.text = ""
            self.recipientTextField.text = ""
            self.sendAmountTextField.placeholder = "0"
            self.recipientTextField.placeholder = "0"
        } else {
            self.fetchRate.amount = self.sendAmountTextField.text
            self.fetchRate.currencyFrom = self.currencyFirstLabel.text
            self.fetchRate.currencyTo = self.currencySecondLabel.text
            self.fetchRate.fetch { currencyRate in
                guard let rates = currencyRate else { return }
                self.recipientTextField.text = String(rates.value)
            }
        }
    }
    
    @objc func editingSecondChanged() {
        guard let text = self.recipientTextField.text else { return }
        if text.isEmpty {
            self.sendAmountTextField.text = ""
            self.recipientTextField.text = ""
            self.recipientTextField.placeholder = "0"
            self.sendAmountTextField.placeholder = "0"
        } else {
            self.fetchRate.amount = self.recipientTextField.text
            self.fetchRate.currencyFrom = self.currencySecondLabel.text
            self.fetchRate.currencyTo = self.currencyFirstLabel.text
            self.fetchRate.fetch { currencyRate in
                guard let rates = currencyRate else { return }
                self.sendAmountTextField.text = String(rates.value)
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction private func sendFirstValue() {
        self.sendAmountTextField.addTarget(self, action: #selector(self.editingFirstChanged), for: .editingChanged)
    }
    
    @IBAction private func sendSecondValue() {
        self.recipientTextField.addTarget(self, action: #selector(self.editingSecondChanged), for: .editingChanged)
    }
    
    @IBAction private func close() {
        self.dismiss(animated: true)
    }
    
    @IBAction private func priceComparison() {
        print("Price Comparison")
    }
    
    @IBAction private func getCountryFrom(_ sender: UIButton) {
        self.isTagCurrentFirstButton = true
        self.moveCountryScreen()
    }
    
    @IBAction private func getCountryTo(_ sender: UIButton) {
        self.isTagCurrentFirstButton = false
        self.moveCountryScreen()
    }
}

// MARK: - Delegate set country code
extension SendScreenViewController: SetCountryCodeDelegate {
    func setCountryCode(image: UIImage, code: String) {
        if self.isTagCurrentFirstButton {
            print(self.isTagCurrentFirstButton)
            self.currentFirstImage.image = image
            self.currencyFirstLabel.text = code
            self.editingFirstChanged()
        } else {
            print(self.isTagCurrentFirstButton)
            self.currentSecondImage.image = image
            self.currencySecondLabel.text = code
            self.editingSecondChanged()
        }
    }
}
