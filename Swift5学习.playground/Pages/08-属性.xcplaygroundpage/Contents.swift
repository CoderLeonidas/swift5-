//: [Previous](@previous)

import Foundation

struct Circle {
    var radius : Double {
        willSet {
            print("willSet", newValue)
        }
        didSet {
            print("didSet", oldValue)

        }
    }
    
    var diameter: Double {
//        set {
//            radius = newValue / 2
//        }
//
        set(newDiameter) {
            radius = newDiameter / 2
        }
        get {
            radius * 2
        }
    }
}

var circle = Circle(radius: 5)
print(circle.radius)
print(circle.diameter)


circle.diameter = 12

print(circle.radius)
print(circle.diameter)


circle.radius = 1

print(circle.radius)
print(circle.diameter)

enum TestEnum : Int {
    case test1 = 1, test2 = 2, test3 = 3
    var rawValue1: Int {
        switch self {
        case .test1:
            return 10
        default:
            return 0
        }
    }
}

var t1 = TestEnum.test1

t1.rawValue1


class Car {
    init() {
        print("Car init!!")
    }
    func run () {
        print("Car is running!!")

    }
}

class Person {
    lazy var car = Car()
    init() {
        print("Person init!")
    }
    func goOut () {
        car.run()
    }
}

let p = Person()
print("------")
p.goOut()

struct Point {
    var x = 0
    var y = 0
    lazy var z = 0
}

//let pt = Point()

var pt = Point()
print(pt.z)

var num : Int {
    get {
        return 10
    }
    set {
        print("setNum", newValue)
    }
}
num = 11
print(num)

func test () {
    var age = 10 {
        willSet {
            print("willSet", newValue)
        }
        didSet {
            print("didSet", oldValue)
        }
    }
    age = 11
}
test ()

struct Shape {
    var width : Int
    var side: Int {
        willSet {
            print("willSetSide", newValue)
        }
        didSet {
            print("didSetSide", oldValue)

        }
    }
    var girth: Int {
        set {
            width = newValue / side
            print("setGirth", newValue)
        }
        get {
            print("getGirth")
            return width * side

        }
    }
    func show() {
        print("width = \(width), side = \(side), girth = \(girth)")
    }
}

func test(_ num: inout Int) {
    num = 20
}

var s  = Shape(width: 10, side: 4)
test(&s.width)
s.show()
print("---------")
test(&s.side)
s.show()
print("---------")
test(&s.girth)
s.show()


struct Car2 {
    static var count : Int = 0
    init() {
        Car2.count += 1
    }
}
let c1 = Car2()
let c2 = Car2()
let c3 = Car2()
print(Car2.count)


public class FileManager {
    public static let shared = FileManager()
    private init() {}
}

var fm = FileManager.shared
//var fm2 = FileManager.init()



