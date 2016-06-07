import Foundation

class Utils {
    class func currencyStringFromNumber(number:Double) -> String{
        let formatter = NSNumberFormatter();
        formatter.numberStyle = .CurrencyStyle
        return formatter.stringFromNumber(number) ?? ""
    }
}
