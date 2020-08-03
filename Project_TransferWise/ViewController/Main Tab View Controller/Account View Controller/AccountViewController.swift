//
//  AccountViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/1/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    // MARK: - Componenets of slide
    private var slider: AccountSettingView?
    private var sliderBackground: UIView?
    private var panGesture: UIPanGestureRecognizer?
    private var tapGesture: UITapGestureRecognizer?
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    // MARK: Load table on slide
    func loadSlide1() {
        self.panGesture = nil
        self.tapGesture = nil
        self.slider = nil
        self.sliderBackground = nil
        self.view.endEditing(true)
        
        guard let shadow = Bundle.main.loadNibNamed("AccountSettingView", owner: nil, options: nil)?.first as? AccountSettingView else { return }
        self.slider = shadow
        print(self.slider.customMirror.children.count)
        
        // Create shadow layer
        self.sliderBackground = UIView(frame: CGRect(origin: .zero, size: self.view.bounds.size))
        self.sliderBackground?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        // Presentation of shadowView
        UIApplication.shared.keyWindow?.addSubview(sliderBackground!)
        
        // Placement of slider view + Construct
        let sliderHeight: CGFloat = self.view.frame.size.height/3
        self.slider?.frame.origin.y = self.view.frame.size.height + sliderHeight
        self.slider?.frame.size.height = sliderHeight
        self.slider?.frame.size.width = self.view.frame.size.width
        
        // presentation of viewSelector
        UIApplication.shared.keyWindow?.addSubview(self.slider!)
        UIView.animate(withDuration: 0.5) {
            self.slider?.frame.origin.y = self.view.frame.size.height - sliderHeight
        }
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.closeSlideView))
        self.sliderBackground?.addGestureRecognizer(self.tapGesture!)
    }
    
    @objc func closeSlideView() {
        UIView.animate(withDuration: 0.5) {
            self.sliderBackground?.alpha = 0.0
            self.slider?.frame.origin.y = self.view.frame.size.height
        }
    }
    
    
    // MARK: - IBActions
    @IBAction private func signOut() {
        loadSlide1()
//        self.tapGesture = nil
//        self.sliderBackground = nil
//        self.sliderBackground = UIView(frame: CGRect(origin: .zero, size: self.view.bounds.size))
//        self.slider = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        self.tapGesture = UITapGestureRecognizer(target: AccountViewController(), action: #selector(self.closeSlideView1))
//        self.loadSlide(sliderBackground: self.sliderBackground, slider: self.slider, tapGesture: self.tapGesture)
    }
}
