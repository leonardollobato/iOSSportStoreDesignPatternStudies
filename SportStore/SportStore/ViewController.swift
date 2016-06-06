//
//  ViewController.swift
//  SportStore
//
//  Created by Leonardo Lobato on 6/6/16.
//  Copyright © 2016 Leonardo Lobato. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var stockStepper:UIStepper!
    @IBOutlet weak var stockField:UITextField!
    
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var totalStockLabel:UILabel!
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStockTotal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.products.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ProductCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
                    as! ProductTableCell
        cell.nameLabel.text = Model.products[indexPath.row].title
        cell.descriptionLabel.text = Model.products[indexPath.row].description
        cell.stockStepper.value = Double(Model.products[indexPath.row].quantity)
        cell.stockField.text = String(Model.products[indexPath.row].price)
        
        return cell
    }
    
    
    func displayStockTotal() {
        let stockTotal = Model.products.reduce(0,combine: {
            (total,product) -> Int in
                return total  + product.quantity
        })
        totalStockLabel.text = "\(stockTotal) Products in Stock"
        
    }


}

