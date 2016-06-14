import UIKit
import Alamofire

class ProductTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var stockStepper:UIStepper!
    @IBOutlet weak var stockField:UITextField!
    
    var product:Product?
    
}

var handler = {
    (p:Product) in
    print("Change: \(p.name) \(p.stockLevel) items in stock")
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var totalStockLabel:UILabel!
    @IBOutlet weak var tableView:UITableView!
    let logger = Logger<Product>(callback: handler)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStockTotal()
    }
    
    func loadJson(){
        
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
        let product = Model.products[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
                    as! ProductTableCell
        
        cell.product = Model.products[indexPath.row]
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.productDescription
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockField.text = String(product.stockLevel)
        
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
                    if let product = cell.product {
    
                        // se o item clicado foi um stepper entra no if
                        if let stepper = sender as? UIStepper {
                            
                            // adiciona o valor na variavel
                            product.stockLevel = Int(stepper.value)
                            
                        }else if let textfield = sender as? UITextField {
                            
                            // se o click foi no textfield, ele pega o valor e add na variavel
                            if let newValue = Int(textfield.text!){
                                product.stockLevel  = newValue
                            }
                        }
                        
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                        logger.logItem(product)

                    }
                    
                    break
                }
            }
            
            displayStockTotal()
        }
    }
    
    
    func displayStockTotal() {
        
        let finalTotals:(Int,Double) = Model.products.reduce((0,0.0),
            combine: {
        (totals, product) -> (Int,Double) in
                return (
                    totals.0 + product.stockLevel,
                    totals.1 + product.stockValue
                )
        })
        
        totalStockLabel.text = "\(finalTotals.0) Products in Stock." +
        "Total Value: \(Utils.currencyStringFromNumber(finalTotals.1))"
        
    }


}

