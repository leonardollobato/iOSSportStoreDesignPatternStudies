
import Foundation

class Product: NSObject, NSCopying{
    private(set) var name:String
    private(set) var productDescription:String
    private(set) var category:String
    private var stockBackingValue:Int = 0
    private var priceBackingValue:Double = 0
    
    init(name: String, productDescription:String, category:String, price:Double, stockLevel:Int){
        self.name = name
        self.productDescription = productDescription
        self.category = category
        
        // this is the superclass initiliazer and MUST be called AFTER the stored properties
        // and BEFORE computed properties.
        super.init()
        
        self.price = price
        self.stockLevel = stockLevel
    }
    
    var stockLevel:Int{
        get{ return stockBackingValue }
        set{ stockBackingValue = max(0, newValue)}
    }
    
    private(set) var price:Double{
        get{ return priceBackingValue }
        set{ priceBackingValue = max(1,newValue) }
        
    }
    
    var stockValue:Double {
        get{ return self.price * Double(self.stockLevel) }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Product(name: self.name, productDescription: self.productDescription,
                       category: self.category, price: self.price,
                       stockLevel: self.stockLevel)
    }
    
    
}