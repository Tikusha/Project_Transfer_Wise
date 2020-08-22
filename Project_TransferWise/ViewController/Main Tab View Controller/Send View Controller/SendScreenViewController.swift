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
    
    // MARK: - Properties
    private let fetchRate = FetchCurrency()
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.priceComparisonButton.customCorner(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.brandBlue)
        self.topView.cornerView(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
        self.bottomView.cornerView(cornerRadius: 3, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchRate.fetch { currencyRates in
            guard let items = currencyRates else { return }
            self.sendAmountTextField.text = String(items.amount)
            self.recipientTextField.text = String(items.value)
            print(items.from)
            print(items.to)
            print(items.amount)
            print(items.value)
        }
    }
    
    // MARK: - IBActions
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
