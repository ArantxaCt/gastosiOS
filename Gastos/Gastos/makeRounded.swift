//
//  makeRounded.swift
//  Gastos
//
//  Created by Arantxa Emanth Cuellar Torres on 26/08/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeRound() {
        
        layer.borderWidth = 0
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
