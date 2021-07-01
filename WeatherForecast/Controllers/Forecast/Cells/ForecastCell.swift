//
//  ForecastCell.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 02/07/2021.
//

import UIKit

class ForecastCell: UITableViewCell {

    // MARK: - @IBOutlets
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var digreeLabel: UILabel!
    @IBOutlet private weak var conditionLabel: UILabel!
    @IBOutlet private weak var conditionImageView: UIImageView!
    
    // MARK: - Override Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dateLabel.text = ""
        digreeLabel.text = ""
        conditionLabel.text = ""
        conditionImageView.image = nil
    }

    // MARK: - Exposed Methods
    func configure(with item: ForecastPresentable) {
        
        dateLabel.text = item.date
        digreeLabel.text = item.digree
        conditionLabel.text = item.condition
        conditionImageView.image = item.conditionIcon        
    }
}
