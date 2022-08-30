//
//  RegisterTableViewCellProtocol.swift
//  Gastos
//
//  Created by Arantxa Emanth Cuellar Torres on 26/08/22.
//

import Foundation
import UIKit

protocol RegisterTableViewCellProtocol: ConfigurarCeldaProtocol {}

extension RegisterTableViewCellProtocol {
    
    static func register(tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func registerForHeaderOrFooter(tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}

extension UITableView {
    func deque<T: RegisterTableViewCellProtocol>(atIndexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: atIndexPath) as! T
    }
}

extension UITableViewCell: RegisterTableViewCellProtocol { }

protocol ConfigurarCeldaProtocol {}

extension ConfigurarCeldaProtocol {
    func set<T: Any>(item: T?, indexPath: IndexPath){
        
    }
}
