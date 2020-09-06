//
//  CountryViewController.swift
//  Project_TransferWise
//
//  Created by Tiko on 8/16/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

protocol SetCountryCodeDelegate {
    func setCountryCode(image: UIImage, code: String)
}

class CountryViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewAll: UITableView!
    
    // MARK: - Properties
    var countriesList = Countries()
    var delegate: SetCountryCodeDelegate?

    // MARK: - View LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.configuration()
    }
    
    // MARK: - Configurarion
    private func configuration() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableViewAll.delegate = self
        self.tableViewAll.dataSource = self
        self.searchView.cornerView(cornerRadius: 12, borderWidth: 0.2, borderColor: Constants.Color.navyMid)
        self.searchTextField.placeholder = "sdkmsdlf"
    }
    
    private func registerCell() {
        self.tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
        self.tableViewAll.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
    }
    
    // MARK: - IBActions
    @IBAction private func close() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension CountryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.countriesList.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell
        cell?.imageCountry.image = self.countriesList.countries[indexPath.row].image
        cell?.codeLabel.text = self.countriesList.countries[indexPath.row].code
        cell?.countryLabel.text = self.countriesList.countries[indexPath.row].country
        return cell!
    }
}

// MARK: - UITableViewDelegate
extension CountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.setCountryCode(image: self.countriesList.countries[indexPath.row].image!, code: self.countriesList.countries[indexPath.row].code ?? "")
        self.dismiss(animated: true, completion: nil)
    }
}

