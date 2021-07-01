//
//  BaseViewController.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit
import MBProgressHUD

typealias ApiCompletion = (_ error: String?) -> Void

class BaseViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoader() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideLoader() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
