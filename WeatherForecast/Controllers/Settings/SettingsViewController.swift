//
//  SettingsViewController.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

class SettingsViewController: BaseViewController {

    // MARK: - @IBOutlets
    @IBOutlet private weak var digreeControl: UISegmentedControl!
    @IBOutlet private weak var speedControl: UISegmentedControl!
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let digreeIndex = AppSettings.shared.digreeType == .centigrade ? 0 : 1
        let speedIndex = AppSettings.shared.speedType == .kmph ? 0 : 1
        
        digreeControl.selectedSegmentIndex = digreeIndex
        speedControl.selectedSegmentIndex = speedIndex
    }
    
    
    // MARK: - @IBActions
    @IBAction func saveClicked(_ sender: Any) {
        
        let digree: AppSettings.DigreeType = digreeControl.selectedSegmentIndex == 0 ? .centigrade : .fahrenheit
        AppSettings.shared.setDigreeType(type: digree)
        
        let speed: AppSettings.SpeedType = speedControl.selectedSegmentIndex == 0 ? .kmph : .mph
        AppSettings.shared.setSpeedType(type: speed)
        
        showAlert(message: "Settings updated!!")
    }
}
