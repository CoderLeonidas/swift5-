//: [Previous](@previous)

import Foundation

// 在swift标准库中，绝大多数的公开类型都是结构体，而枚举和类只占很小的一部分
// 比如Bool，Int，Double，String，Array，Dictionary等常见类型都是结构体

struct Date {
    var year: Int
    var month: Int
    var day: Int
}

var date = Date(year: 2109, month: 6, day: 23)


struct Point {
    var x: Int = 0
    var y: Int = 0
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
//
var p1 = Point(x: 10, y: 10)


class Point2 {
    
    var x: Int = 0
    var y: Int = 0
    init() {
        x = 10
        y = 10
    }
}

let p2 = Point2()


class Size {
    var width: Int
    var height: Int
    init(width:Int, height: Int) {
        self.width = width
        self.height = height
    }
}

func printAddress(values: AnyObject...) {
    for value in values {
        print(Unmanaged.passUnretained(value).toOpaque())
    }
}

func test(){
    var s1 = Size(width: 10, height: 20)
    var s2 = s1
    
    s2.width = 11
    s2.height = 22
    
    print(s1)
    print(s2)
    
//    printAddress(values: s1, s2)

}

test()

class Point3 {
    var x = 1
    var y = 2
    var test = true
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
}
var p = Point3(x: 3, y: 4)
class_getInstanceSize(type(of: p))
class_getInstanceSize(Point3.self)

printAddress(values: p)


p = Point3(x: 10, y: 20)


