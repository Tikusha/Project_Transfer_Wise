//
//  SliderView.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/2/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class AccountSettingView: UIView {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var viewLine: UIView!
    
    // MARK: - View LifeCyrcle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: [.topLeft, .topRight], radius: 15)
        self.viewLine.customBorder(cornerRadius: 2, borderWidth: 0.2, borderColor: Constants.Color.disabledGrey)
    }
    
    // MARK: - IBActions
    @IBAction func settings() {
        let vc = SettingsViewController()
        vc.modalPresentationStyle = .fullScreen
//        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
//        let vc: CampainDetailView = storyboard.instantiateViewControllerWithIdentifier("campainDetailView") as! CampainDetailView
//        let currentController = self.getCurrentViewController()
//        currentController?.presentViewController(vc, animated: false, completion: nil)
    }
    
    @IBAction func help() {
        
    }
    
    @IBAction func logOut() {
        
    }
}
