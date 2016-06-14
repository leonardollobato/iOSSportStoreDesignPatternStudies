
import Foundation

class Model{
    
    static var products:[Product] = [
        Product(name:"Kayak", productDescription: "A boat for one person", category:"Watersports", price:275.0, stockLevel:10),
        Product(name:"Lifejacket",productDescription: "Protective and fashionable",category: "Watersports",price: 48.95, stockLevel:14),
        Product(name:"Soccer Ball", productDescription:"FIFA-approved size and weight",category: "Soccer", price:19.5, stockLevel:32),
        Product(name:"Corner Flags", productDescription:"Give your playing field a professional touch",category: "Soccer", price:34.95, stockLevel:1),
        Product(name:"Stadium", productDescription:"Flat-packed 35,000-seat stadium",category: "Soccer", price:79500.0, stockLevel:4),
        Product(name:"Thinking Cap", productDescription:"Improve your brain efficiency by 75%", category:"Chess", price:16.0, stockLevel:8),
        Product(name:"Unsteady Chair", productDescription:"Secretly give your opponent a disadvantage",category: "Chess", price:29.95, stockLevel:3),
        Product(name:"Human Chess Board",productDescription: "A fun game for the family", category:"Chess", price:75.0, stockLevel:2),
        Product(name:"Bling-Bling King", productDescription:"Gold-plated, diamond-studded King", category:"Chess", price:1200.0, stockLevel:4)]
}
