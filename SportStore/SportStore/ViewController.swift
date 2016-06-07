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
    
    var productId:Int?
    
    
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
        
        cell.productId = indexPath.row
        cell.nameLabel.text = Model.products[indexPath.row].title
        cell.descriptionLabel.text = Model.products[indexPath.row].description
        cell.stockStepper.value = Double(Model.products[indexPath.row].quantity)
        cell.stockField.text = String(Model.products[indexPath.row].quantity)
        
        return cell
    }
    
    @IBAction func stockLevelDidChange(sender:AnyObject){
        
        // Verifica se o component clicado é uma view
        if var currentCell = sender as? UIView{
            while(true){
                // sendo uma view, ele obtem a parent view, no caso a view seria o stepper e o parent seria o UITableViewCell
                currentCell = currentCell.superview!
                
                // converte o UITableViewCell para o Product*
                if let cell = currentCell as? ProductTableCell{
                    
                    // Obtem o id pelo index
                    if let id = cell.productId {
                        var newStockLevel:Int?
                        
                        // se o item clicado foi um stepper entra no if
                        if let stepper = sender as? UIStepper {
                            
                            // adiciona o valor na variavel
                            newStockLevel = Int(stepper.value)
                            
                        }else if let textfield = sender as? UITextField {
                            
                            // se o click foi no textfield, ele pega o valor e add na variavel
                            if let newValue = Int(textfield.text!){
                                newStockLevel = newValue
                            }
                        }
                        
                        
                        if let level = newStockLevel{
                            
                            // atualiza o model pelo id
                            Model.products[id].quantity = level
                            
                            // atualiza o stepper value
                            cell.stockStepper.value = Double(level)
                            
                            //atualiza o textfield
                            cell.stockField.text = String(level)
                        }
                    }
                    break
                }
            }
            
            displayStockTotal()
        }
    }
    
    
    func displayStockTotal() {
        let stockTotal = Model.products.reduce(0,combine: {
            (total,product) -> Int in
                return total  + product.quantity
        })
        totalStockLabel.text = "\(stockTotal) Products in Stock"
        
    }


}

