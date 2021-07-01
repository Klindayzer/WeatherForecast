//
//  DetailsViewController.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 02/07/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - @IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Private Properties
    private var viewModel: DetailsViewModel?
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupTableView()
    }

    
    // MARK: - Exposed Methods
    func configure(viewModel: DetailsViewModel?) {
        self.viewModel = viewModel
    }
    
    
    // MARK: - Private Methods
    private func setupTableView() {
        
        tableView.register(DetailsCell.self)
        tableView.reloadData()
    }
    
    
    // MARK: - @IBActions
    @IBAction func dismissClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: DetailsCell = tableView.dequeueReusableCell(for: indexPath)
        
        if let details = viewModel?.item(at: indexPath.row) {
            cell.configure(with: details)
        }
        
        return cell
    }
}
