//
//  ForecastViewController.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

class ForecastViewController: BaseViewController {

    // MARK: - @IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Private Properties
    private let viewModel = ForecasrViewModel()
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchForecast()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateUI()
    }
    
    
    // MARK: - Private Methods
    private func setupTableView() {
        tableView.register(ForecastCell.self)
    }
    
    private func fetchForecast() {
        
        showLoader()
        viewModel.fetchForcastUpdates(days: 10) { [weak self] error in
            
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
        
        titleLabel.text = "\(AppSettings.shared.selectedCity) Forecast"
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension ForecastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ForecastCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let item = viewModel.item(at: indexPath.row) {
            cell.configure(with: item)
        }
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ForecastViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let controller: DetailsViewController = viewController(DetailsViewController.self) {
            controller.configure(viewModel: viewModel.detailsViewModel(at: indexPath.row))
            present(controller, animated: true, completion: nil)
        }
    }
}
