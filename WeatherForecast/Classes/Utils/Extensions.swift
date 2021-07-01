//
//  Extensions.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

extension UIView {
    
    final class var name: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
                
        let nib =  UINib(nibName: T.name, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: T.name)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.name, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.name)")
        }
        return cell
    }
}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) {
                
        let nib =  UINib(nibName: T.name, bundle: Bundle.main)
        register(nib, forCellWithReuseIdentifier: T.name)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.name, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.name)")
        }
        return cell
    }
}

extension Collection {
        
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UIViewController {
    
    func viewController<T: UIViewController>(_: T.Type) -> T? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: T.identifier) as? T
        return controller
    }
    
    final class var identifier: String {
        return String(describing: self)
    }
}
