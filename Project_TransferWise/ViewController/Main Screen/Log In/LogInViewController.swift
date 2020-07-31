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

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInitilazer()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.logInButton.customCorner(cornerRadius: 2, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        self.appleButton.customCorner(cornerRadius: 2, borderWidth: 0.5, borderColor: .black)
        self.faceButton.customCorner(cornerRadius: 2, borderWidth: 0.5, borderColor: .black)
        self.googleButton.customCorner(cornerRadius: 2, borderWidth: 0.5, borderColor: Constants.Color.darkBlue)
    }
    
    private func setInitilazer() {
            let image = UIImage(named: "general_icon_back")
            let barButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(back))
    //        let barButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
    //        print(barButton)
            self.navigationItem.setRightBarButton(barButton, animated: true)
    //        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(back))
    //               self.navigationItem.setRightBarButton(button, animated: true)
            
            let btn1 = UIButton(type: .custom)
            btn1.setImage(UIImage(named: "general_icon_back"), for: .normal)
            btn1.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
            btn1.addTarget(self, action: #selector(back), for: .touchUpInside)
            let item1 = UIBarButtonItem(customView: btn1)
            self.navigationItem.setRightBarButton(item1, animated: true)
        }
        
        @objc func back() {
            self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: -IBActions
    @IBAction private func logIn(_ sender: Any) {
        let vc = MainTabViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
