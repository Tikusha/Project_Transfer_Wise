//
//  UIVIewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/2/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

extension UIViewController {
    
 
    func loadSlide(sliderBackground: UIView?, slider: UIView?, tapGesture: UITapGestureRecognizer?) {
        slider?.backgroundColor = .systemGreen
        
        // Create shadow layer
        sliderBackground?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        // Presentation shadew layer
        UIApplication.shared.keyWindow?.addSubview(sliderBackground!)
        
        // Placement of slider
        let slideHeight: CGFloat = 220.0
        slider?.frame.origin.y = self.view.frame.size.height
        slider?.frame.size.height = slideHeight
        slider?.frame.size.width = self.view.frame.size.width
        
        // Presentation of viewSelector
        UIApplication.shared.keyWindow?.addSubview(slider!)
        UIView.animate(withDuration: 0.7) {
            slider?.frame.origin.y = self.view.frame.size.height - slideHeight
        }
       
        sliderBackground?.addGestureRecognizer(tapGesture!)
    }
    
    @objc func closeSlideView1(sliderBackground: UIView?, slider: UIView?) {
        print("iiiii")
        UIView.animate(withDuration: 0.5) {
            sliderBackground?.alpha = 0.0
            slider?.frame.origin.y = self.view.frame.size.height
        }
    }
}
