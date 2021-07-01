//
//  DetailsCell.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

class DetailsCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    
    // MARK: - Override Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        valueLabel.text = ""
    }
    
    
    // MARK: - Exposed Methods
    func configure(with item: DetailsCellPresentable) {
        
        titleLabel.text = item.title.uppercased()
        valueLabel.text = item.value
    }
}
