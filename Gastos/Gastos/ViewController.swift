//
//  ViewController.swift
//  Gastos
//
//  Created by Arantxa Emanth Cuellar Torres on 26/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImageView.makeRound()
    }


}
