//: [Previous](@previous)

import Foundation

class Car {
    static var count = 0
    
    init() {
        Car.count += 1
    }
    static func getCount() -> Int {
        count
//        self.count
//        Car.count
//        Car.self.count
    }
}

let c0 = Car()

let c1 = Car()
let c2 = Car()
let c3 = Car()

Car.getCount()



struct Point {
    var x: Double = 0
    var y: Double = 0
    mutating func moveBy(deltaX: Double, deltaY:Double) {
        x += deltaX
        y += deltaY
    }
    
   @discardableResult mutating func moveX(deltaX: Double) -> Double {
        x += deltaX
        return x
    }
}

var pt = Point()
pt.moveX(deltaX: 2)

enum StateSwitch {
    case low, middle, high
    mutating func next() -> Void {
        switch self {
        case .low:
            self = .middle
        
        case .middle:
            self = .high
            
        
        case .high:
            self = .low
        }
    }
}


//: [Next](@next)
