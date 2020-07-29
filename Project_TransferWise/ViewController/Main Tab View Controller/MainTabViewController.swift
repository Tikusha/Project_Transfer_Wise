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
        
        UINavigationBar.appearance().prefersLargeTitles = true
        self.viewControllers = generateControllers()
    }
    
    private func generateControllers() -> [UIViewController] {
        let home = generateNavController(vc: HomeViewController(), title: "Home", image: #imageLiteral(resourceName: "home"))
        let account = generateNavController(vc: InviteViewController(), title: "Account", image: #imageLiteral(resourceName: "account") )
        let send = generateNavController(vc: SendScreenViewController(), title: "Send", image: nil)
//        let send = generatePresentController()
        let recipients = generateNavController(vc: InviteViewController(), title: "Recipients", image: #imageLiteral(resourceName: "recipients") )
        let invite = generateNavController(vc: InviteViewController(), title: "Invite", image: #imageLiteral(resourceName: "invite") )
        
        self.setupMiddleButton()
        return [home, account, send, recipients, invite]
    }
    
    private func generateNavController(vc: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        if let image = image {
            navController.tabBarItem.image = image
        }
        return navController
    }
    
    private func generatePresentController() -> UIViewController {
        let vc = UIViewController(nibName: "SendScreenViewController", bundle: nil)
        self.present(vc, animated: true)
        return vc
    }
    
    func setupMiddleButton() {
        let frame = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var shadeFrame = frame.frame
        shadeFrame.origin.y = view.bounds.height - shadeFrame.height/2 * 4.3
        shadeFrame.origin.x = view.bounds.width/2 - shadeFrame.size.width/2
        frame.frame = shadeFrame
        frame.backgroundColor = UIColor.white
        frame.layer.cornerRadius = shadeFrame.height/2
//        frame.customBorder(cornerRadius: 25, borderWidth: 1, borderColor: .gray)
        frame.roundCorners(corners: [.topLeft, .topRight], radius: 25)
        view.addSubview(frame)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        var buttonFrame = button.frame
        buttonFrame.origin.y = frame.bounds.height/2 - buttonFrame.height/2
        print(frame.bounds.height)
        buttonFrame.origin.x = frame.bounds.width/2 - buttonFrame.size.width/2
        button.frame = buttonFrame
         button.backgroundColor = UIColor.green
        
        button.layer.cornerRadius = buttonFrame.height/2
        frame.addSubview(button)
        

//        button.setImage(UIImage(named: "example"), for: .normal)
        button.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

        view.layoutIfNeeded()
        
        
    }
    
    
    
    @objc private func menuButtonAction(sender: UIButton) {
        selectedIndex = 2
        print("jfkdjfkdf")
        generatePresentController()
    }
}
