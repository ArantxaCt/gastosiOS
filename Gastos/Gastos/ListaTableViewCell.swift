//
//  ListaTableViewCell.swift
//  Gastos
//
//  Created by Arantxa Emanth Cuellar Torres on 26/08/22.
//

import UIKit

class ListaTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenProdImageView: UIImageView!
    @IBOutlet weak var productoLabel: UILabel!
    @IBOutlet weak var tipoGastoLabel: UILabel!
    @IBOutlet weak var gastoLabel: UILabel!
    @IBOutlet weak var horaGastoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        imagenProdImageView.makeRound()
        tipoGastoLabel.adjustsFontSizeToFitWidth = true
    }
    
}
