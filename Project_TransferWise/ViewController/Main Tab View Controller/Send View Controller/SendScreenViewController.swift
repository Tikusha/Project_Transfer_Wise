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
    
    // MARK: - Properties
    private let fetchRate = FetchCurrency()
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        self.dismissKeyboard()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.priceComparisonButton.customCorner(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.brandBlue)
        self.topView.cornerView(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
        self.bottomView.cornerView(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
//        self.sendAmountTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchRate.fetch { currencyRate in
            guard let rates = currencyRate else { return }
            self.recipientTextField.text = String(rates.value)
        }
    }
    
    @objc func editingFirstChanged() {
        if self.sendAmountTextField.text == "" {
            self.sendAmountTextField.placeholder = "0"
            self.recipientTextField.placeholder = "0"
            return
        }
        self.fetchRate.amount = self.sendAmountTextField.text
        self.fetchRate.currencyFrom = "GEL"
        self.fetchRate.currencyTo = "USD"
        self.fetchRate.fetch { currencyRate in
            guard let rates = currencyRate else { return }
            self.recipientTextField.text = String(rates.value)
        }
    }
    
    @objc func editingSecondChanged() {
        if self.recipientTextField.text == "" {
            self.recipientTextField.placeholder = "0"
            self.sendAmountTextField.placeholder = "0"
        }
        self.fetchRate.amount = self.recipientTextField.text
        self.fetchRate.currencyFrom = "USD"
        self.fetchRate.currencyTo = "GEL"
        self.fetchRate.fetch { currencyRate in
            guard let rates = currencyRate else { return }
            self.sendAmountTextField.text = String(rates.value)
        }
    }
   
    // MARK: - IBActions
    @IBAction func sendFirstValue() {
        self.sendAmountTextField.addTarget(self, action: #selector(self.editingFirstChanged), for: .editingChanged)
    }
    
    @IBAction func sendSecondValue() {
        self.recipientTextField.addTarget(self, action: #selector(self.editingSecondChanged), for: .editingChanged)
    }
    
    @IBAction private func close() {
        self.dismiss(animated: true)
    }
    
    @IBAction private func priceComparison() {
        print("Price Comparison")
    }
    
    @IBAction private func currentCountry() {
        let vc = CountryViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

extension SendScreenViewController: UITextFieldDelegate {
    
}
