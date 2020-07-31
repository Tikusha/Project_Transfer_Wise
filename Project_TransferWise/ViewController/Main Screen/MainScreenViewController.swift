//
//  ViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 7/10/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pictureView: UIImageView!
    @IBOutlet private weak var logInButton: UIButton!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var googleButton: UIButton!
    
    private let listTexts = MoneyTexts()
    
    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.configuration()
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.logInButton.customCorner(cornerRadius: 2, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        self.signInButton.customCorner(cornerRadius: 2, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
        self.googleButton.customCorner(cornerRadius: 2, borderWidth: 0.2, borderColor: Constants.Color.brandBlue)
    }
    
    private func registerCell() {
        self.collectionView.register(UINib(nibName: "TitleCell", bundle: nil), forCellWithReuseIdentifier: "TitleCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - IBActions
    @IBAction private func logIn(_ sender: Any) {
        let vc = LogInViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
        
        //        self.navigationController?.pushViewController(LogInViewController(), animated: true)
    }
    
    @IBAction private func register(_ sender: Any) {
        self.present(SignInViewController(), animated: true, completion: nil)
    }
}

extension MainScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.pictureView.image = UIImage(named: "general_icon_back")
    }
}

extension MainScreenViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pictureView.image = UIImage(named: "general_icon_back")
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("dfnkndkjfkdnfnldf")
    }
}

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.listTexts.largeText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as? TitleCell
        cell?.largeText.text = self.listTexts.largeText[indexPath.row]
        cell?.smallText.text = self.listTexts.smallText[indexPath.row]
        return cell!
    }
}

extension MainScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
}

