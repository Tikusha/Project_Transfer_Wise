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

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
    }
    
    // MARK: - IBActions
    @IBAction private func register(_ sender: Any) {
        guard let email = self.emailTextfield.text?.isNotEmpty,
            let password = self.passwordTextfield.text?.isNotEmpty else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error == nil {
                print("0000")
            }
        }
    }
}

extension String {
    var isNotEmpty: String? {
        if self.isEmpty { return nil }
        return self
    }
}
