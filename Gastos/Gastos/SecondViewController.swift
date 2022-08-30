//
//  SecondViewController.swift
//  Gastos
//
//  Created by Arantxa Emanth Cuellar Torres on 26/08/22.
//

import UIKit

struct plataformas {
    let image: String
    let nombreProd: String
    let tipoGasto: String
    let gasto: String
    let hora: String
}

class SecondViewController: UIViewController {

    @IBOutlet weak var showTableViewButton: UIButton!
    @IBOutlet weak var gastosTableView: UITableView!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var flechaImageView: UIImageView!
    @IBOutlet weak var totalPagarLabel: UILabel!
    
    var pagosPendientes: [plataformas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var pagosTotal: Float = 0.00
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 3
        formatter.alwaysShowsDecimalSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        self.navigationController?.navigationBar.isHidden = true
        profileImageView.makeRound()
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 20
        infoView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM yyyy"
        let dateStr1 = dateFormatter1.string(from: Date.now)
        fechaLabel.text = dateStr1.capitalized.replacingOccurrences(of: ".", with: ",")
        
        self.gastosTableView.delegate = self
        self.gastosTableView.dataSource = self
        self.gastosTableView.separatorStyle = .none
        
        ListaTableViewCell.register(tableView: self.gastosTableView)
        
        pagosPendientes.append(plataformas(image: "airbnb.png", nombreProd: "Airbnb", tipoGasto: "Rental", gasto: "-$" +  formatter.string(from: NSNumber(value: 53937.48))!, hora: "9:10 PM"))
        pagosPendientes.append(plataformas(image: "sarantayler.png", nombreProd: "Sara & Tayler", tipoGasto: "Transfer to your friends", gasto: "-$" +  formatter.string(from: NSNumber(value: 30000.00))!, hora: "6:50 PM"))
        pagosPendientes.append(plataformas(image: "netflix.png", nombreProd: "Netflix", tipoGasto: "Streaming Service", gasto: "-$" +  formatter.string(from: NSNumber(value: 2100.00))!, hora: "2:30 PM"))
        pagosPendientes.append(plataformas(image: "spotify.png", nombreProd: "Spotify", tipoGasto: "Music Platform", gasto: "-$" +  formatter.string(from: NSNumber(value: 1500.99))!, hora: "11:00 AM"))
        pagosPendientes.append(plataformas(image: "amazon.png", nombreProd: "Amazon", tipoGasto: "Online Shop", gasto: "-$" +  formatter.string(from: NSNumber(value: 21999.99))!, hora: "22:14 AM"))
        pagosPendientes.append(plataformas(image: "nike.png", nombreProd: "Nike", tipoGasto: "Shoes, Clothing & Accessories", gasto: "-$" +  formatter.string(from: NSNumber(value: 2567.45))!, hora: "14:27 AM"))
        pagosPendientes.append(plataformas(image: "starbucks.png", nombreProd: "Starbucks", tipoGasto: "Coffee Shop", gasto: "-$" +  formatter.string(from: NSNumber(value: 97.00))!, hora: "18:23 AM"))
        
        for plataforma in pagosPendientes.indices {
            var dato = pagosPendientes[plataforma].gasto.replacingOccurrences(of: "-$", with: "").replacingOccurrences(of: ",", with: "")
            pagosTotal += Float(dato) ?? 0.00
        }
        
        totalPagarLabel.text = "$" + formatter.string(from:NSNumber(value:pagosTotal))!
    }

    @IBAction func showTableViewActionButton(_ sender: Any) {
        
        if showTableViewButton.isTouchInside && flechaImageView.image == UIImage(named: "flechaAbajo.png") {
            flechaImageView.image = UIImage(named: "flechaDerecha.png")
            gastosTableView.isHidden = true
        } else {
            flechaImageView.image = UIImage(named: "flechaAbajo.png")
            gastosTableView.isHidden = false
        }
        
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.pagosPendientes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListaTableViewCell = gastosTableView.deque(atIndexPath: indexPath)

        cell.imagenProdImageView.image = UIImage(named: self.pagosPendientes[indexPath.row].image)
        cell.productoLabel.text = self.pagosPendientes[indexPath.row].nombreProd
        cell.tipoGastoLabel.text = self.pagosPendientes[indexPath.row].tipoGasto
        cell.gastoLabel.text = self.pagosPendientes[indexPath.row].gasto
        cell.horaGastoLabel.text = self.pagosPendientes[indexPath.row].hora

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.performSegue(withIdentifier: "cellDetails", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! ThirdViewController
        let selectedRow = self.gastosTableView.indexPathForSelectedRow?.row
        
        detailsVC.productoNombre = self.pagosPendientes[selectedRow!].nombreProd
        detailsVC.productoImagen = UIImage(named: self.pagosPendientes[selectedRow!].image)
        detailsVC.gastoProducto = self.pagosPendientes[selectedRow!].gasto.replacingOccurrences(of: "-", with: "")
        
    }
    
}
