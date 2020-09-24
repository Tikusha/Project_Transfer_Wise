//
//  AddRecipientViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/13/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class AddRecipientViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var myselfView: UIView!
    @IBOutlet private weak var someoneElseView: UIView!
    @IBOutlet private weak var businessView: UIView!
    @IBOutlet private weak var webView: UIWebView!
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
        let url = URL(string: "https://www.google.com")
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
    }
    
    // MARK: - Configuration
    private func configuration() {
        let heightMyself = self.myselfView.frame.size.height
        let heightSomeone = self.someoneElseView.frame.size.height
        let heightBusiness = self.businessView.frame.size.height
        self.myselfView.cornerView(cornerRadius: heightMyself/2, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
        self.someoneElseView.cornerView(cornerRadius: heightSomeone/2, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
        self.businessView.cornerView(cornerRadius: heightBusiness/2, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
    }
    
    // MARK: - IBActions
    @IBAction private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func aboutMyself() {
        let vc = AboutUserViewController()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction private func aboutSomeoneElse() {
        let vc = BusinessViewController()
        vc.name = "Someone else"
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction private func aboutBusiness() {
        let vc = BusinessViewController()
        vc.name = "A business / charity"
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
}
