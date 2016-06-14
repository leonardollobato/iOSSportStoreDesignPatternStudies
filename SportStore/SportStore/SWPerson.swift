import Foundation

class SWPerson {
    private var _name:String!
    private var _height:String!
    private var _birthYear:String!
    private var _hairColor:String!
    
    var name:String { get{return self.name} }
    var height:String { get{return self._height} }
    var birthYear:String { get{return self._birthYear} }
    var hairColor:String { get{return self._hairColor} }
    
    init(name:String, height:String, birthYear:String, hairColor:String){
        self._name = name
        self._height = height
        self._birthYear = birthYear
        self._hairColor = hairColor
    }
}
