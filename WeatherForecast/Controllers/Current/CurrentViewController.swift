//
//  CurrentViewController.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 30/06/2021.
//

import UIKit

class CurrentViewController: BaseViewController {
    
    // MARK: - @IBOutlets
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var conditionLabel: UILabel!
    @IBOutlet private weak var conditionImageView: UIImageView!
    @IBOutlet private weak var digreeLabel: UILabel!
    @IBOutlet private weak var fellsLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Private Properties
    private let viewModel = ForecasrViewModel()
    private var detailsViewModel: DetailsViewModel?
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchWeather()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateUI()
    }
    
    
    // MARK: - Private Methods
    private func setupTableView() {
        tableView.register(DetailsCell.self)
    }
    
    private func fetchWeather() {
        
        showLoader()
        viewModel.fetchForcastUpdates(days: 1) { [weak self] error in
            
            defer {
                self?.hideLoader()
            }
            
            if let error = error {
                self?.showAlert(message: error)
                return
            }
            
            self?.updateUI()
        }
    }
    
    private func updateUI() {
        
        detailsViewModel = viewModel.detailsViewModel(at: 0)
        
        cityLabel.text = viewModel.currentPresentable.city
        countryLabel.text = viewModel.currentPresentable.country
        conditionLabel.text = viewModel.currentPresentable.condition
        digreeLabel.text = viewModel.currentPresentable.digree
        fellsLabel.text = viewModel.currentPresentable.feels
        conditionImageView.image = viewModel.currentPresentable.conditionIcon
        
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension CurrentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsViewModel?.itemsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: DetailsCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let details = detailsViewModel?.item(at: indexPath.row) {
            cell.configure(with: details)
        }
        
        return cell
    }
}
