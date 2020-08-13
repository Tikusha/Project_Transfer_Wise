//
//  AccountViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/1/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var homeView: UIView!
    @IBOutlet private weak var detailView: UIView!
    @IBOutlet private weak var contactView: UIView!
    
    // MARK: - Componenets of slide
    private var slider: AccountSettingView?
    private var sliderBackground: UIView?
    private var panGesture: UIPanGestureRecognizer?
    private var tapGesture: UITapGestureRecognizer?
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.view.backgroundColor = .white
        let heightContact = self.contactView.frame.size.height
        let heightHome = self.homeView.frame.size.height
        let heightdetail = self.detailView.frame.size.height
        self.homeView.customBorder(cornerRadius: heightHome/2, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
        self.detailView.customBorder(cornerRadius: heightdetail/2, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
        self.contactView.customBorder(cornerRadius: heightContact/2, borderWidth: 1, borderColor: Constants.Color.keylineGrey)
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
        self.slider?.delegate = self
        print(self.slider.customMirror.children.count)
        
        // Create shadow layer
        self.sliderBackground = UIView(frame: CGRect(origin: .zero, size: self.view.bounds.size))
        self.sliderBackground?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        // Presentation of shadowView
        UIApplication.shared.keyWindow?.addSubview(sliderBackground!)
        
        // Placement of slider view + Construct
        let sliderHeight: CGFloat = self.view.frame.size.height/2.5
        print(self.view.frame.size.height)
        print(self.view.frame.size.height/3)
        print(sliderHeight)
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

extension AccountViewController: MoveOtherScreenDelegate {
    func selectLogOut() {
        self.closeSlideView()
        let vc = MainScreenViewController(nibName: "MainScreen", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}
