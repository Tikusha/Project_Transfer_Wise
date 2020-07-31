//
//  MainTabViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/19/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.delegate = self
        UINavigationBar.appearance().prefersLargeTitles = true
        
        self.viewControllers = generateControllers()
        self.setupTabBarColor()
    }
    
    private func setupTabBarColor() {
        self.tabBar.tintColor = Constants.Color.blueDown
        self.tabBar.layer.backgroundColor = UIColor.white.cgColor
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.layer.borderColor = UIColor.red.cgColor
        self.tabBar.clipsToBounds = true
//        self.tabBar.backgroundColor = UIColor.red
    }
    
    // MARK: - Generate Controllers
    private func generateControllers() -> [UIViewController] {
        let home = setITabBarItem(vc: HomeViewController(), title: "Home", image: #imageLiteral(resourceName: "home"))
        let account = setITabBarItem(vc: InviteViewController(), title: "Account", image: #imageLiteral(resourceName: "account") )
        let send = setITabBarItem(vc: SendScreenViewController(), title: "Send", image: nil)
        let recipients = setITabBarItem(vc: InviteViewController(), title: "Recipients", image: #imageLiteral(resourceName: "recipients") )
        let invite = setITabBarItem(vc: InviteViewController(), title: "Invite", image: #imageLiteral(resourceName: "invite") )
        
        self.setupMiddleIcon()
        return [home, account, send, recipients, invite]
    }
    
    // MARK: - Set Tab Bar Items
    private func setITabBarItem(vc: UIViewController, title: String, image: UIImage?) -> UIViewController {
        vc.tabBarItem.title = title
        if let image = image {
            vc.tabBarItem.image = image
        }
        return vc
    }
    
    // MARK: - Setup Middle Icon
    private func setupMiddleIcon() {
        let frame = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var shadeFrame = frame.frame
        shadeFrame.origin.y = self.view.bounds.height - shadeFrame.height/2 * 4.3
        shadeFrame.origin.x = self.view.bounds.width/2 - shadeFrame.size.width/2
        frame.frame = shadeFrame
        frame.backgroundColor = UIColor.white
        frame.layer.cornerRadius = shadeFrame.height/2
        self.view.addSubview(frame)
        
        let middleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        var buttonFrame = middleButton.frame
        buttonFrame.origin.y = frame.bounds.height/2 - buttonFrame.height/2
        print(frame.bounds.height)
        buttonFrame.origin.x = frame.bounds.width/2 - buttonFrame.size.width/2
        middleButton.frame = buttonFrame
        middleButton.backgroundColor = Constants.Color.brandBlue
        middleButton.layer.cornerRadius = buttonFrame.height/2
        middleButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        frame.addSubview(middleButton)
    }
    
    @objc func actionButton() {
        let result = tabBarController(self, shouldSelect: SendScreenViewController())
        print(result)
    }
}

extension MainTabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: SendScreenViewController.self) {
            let vc = SendScreenViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            return false
        }
        return true
    }
}
