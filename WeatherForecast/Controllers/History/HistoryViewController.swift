//
//  HistoryViewController.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

class HistoryViewController: BaseViewController {

    // MARK: - @IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Private Properties
    private let viewModel = HistoryViewModel()
    private let limitedDays = 5
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchHistory()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateUI()
    }
    
    
    // MARK: - Private Methods
    private func setupTableView() {
        tableView.register(ForecastCell.self)
    }
    
    private func fetchHistory() {
        
        showLoader()
        viewModel.fetchHistory(startDate: DateGenerator.date(before: limitedDays), endDate: DateGenerator.yesterdayDate) { [weak self] error in
            
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
        
        titleLabel.text = "\(AppSettings.shared.selectedCity) History"
        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension HistoryViewController: UITableViewDataSource {
    
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
extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let controller: DetailsViewController = viewController(DetailsViewController.self) {
            controller.configure(viewModel: viewModel.detailsViewModel(at: indexPath.row))
            present(controller, animated: true, completion: nil)
        }
    }
}
