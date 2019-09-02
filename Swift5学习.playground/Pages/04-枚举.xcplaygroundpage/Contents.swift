//: [Previous](@previous)

import Foundation

/*
 枚举的基本用法
 */

enum Direction {
    case north
    case south
    case east
    case west
}

enum Direction2 {
    case north, south, east, west
}

var dir = Direction.west
dir = Direction.east
dir = .north
print(dir )

switch dir {
    case .north:
        print("north")
    case .south:
        print("south")
    case .east:
        print("east")
    case .west:
        print("west")
}

/*
 关联值
 有时将枚举的成员值和其他类型的值关联存储在一起回非常有用
 */

enum Score {
    case points(Int)
    case grade (Character)
}
// 每一个枚举值可以有更多维度
var score = Score.points(96)
score = .grade("A")

switch score {
    case let .points(i):
        print(i, "points")
    
    case let .grade(i):
        print(i, "grade")
}

enum Date {
    case digit(year: Int, month: Int, day:Int)
    case string(String)
}

// 必要时，let也可以改为var
var date = Date.digit(year: 2011, month: 9, day: 10)
date = .string("2011-09-10")
switch date {
    case .digit(let year, let month, let day):
        print(year, month, day)
    case let .string(value):
        print(value)
}

/*
 关联值l举例
 */

enum Password {
    case number(Int, Int, Int, Int)
    case gesture(String)
}

var pwd = Password.number(3, 5, 7, 8)
pwd = .gesture("12369")
switch pwd {
case let .number(n1, n2, n3, n4):
    print("number is ", n1, n2, n3, n4)
case let .gesture(str):
    print("gesture is ", str)
}


/*
 枚举成员可以使用相同类型的默认值预先对应，这个默认值叫做：原始值
 
 注意：原始值不占用枚举变量的内存
 */

enum PokerSuit: Character {
    case spade = "♠️"
    case heart = "♥️"
    case diamond = "♦️"
    case club = "♣️"
}

var suit = PokerSuit.spade
print(suit)
print(suit.rawValue)
print(PokerSuit.club.rawValue)

enum Grade: String {
    case perfect = "A"
    case great = "B"
    case good = "C"
    case bad  = "D"
}

print(Grade.perfect.rawValue)
print(Grade.great.rawValue)
print(Grade.good.rawValue)
print(Grade.bad.rawValue)

/*
 隐式原始值
 如果枚举的原始值类型是Int、String，Swift会自动分配原始值
 */

enum Direction3: String {
    case north = "north"
    case south  = "south"
    case east = "east"
    case west = "west"
}

// 等价于

enum Direction4: String {
    case north, south, east , west
}

print(Direction3.north)
print(Direction4.north.rawValue)

enum Season: Int  {
    case spring, summer, autumn, wiinter
}
print(Season.spring.rawValue)
print(Season.summer.rawValue)
print(Season.autumn.rawValue)
print(Season.wiinter.rawValue)


enum Season2: Int {
    case spring = 1, summer, autumn = 4, winter
}
print(Season2.spring.rawValue)
print(Season2.summer.rawValue)
print(Season2.autumn.rawValue)
print(Season2.winter.rawValue)

/*
 递归枚举  ？？？？编译不通过
 */

//indirect enum ArithExpr {
//    case number(Int)
//    case sum(ArithExpr, ArithExpr)
//    case difference(ArithExpr, ArithExpr)
//}
//
//enum ArithExpr {
//    case number(Int)
//    indirect case sum(ArithExpr, ArithExpr)
//    indirect case difference(ArithExpr, ArithExpr)
//}
//
//let five = ArithExpr.number(5)
//let four = ArithExpr.number(4)
//let two  = ArithExpr.number(2)
//let sum = ArithExpr.sum(five, four)
//let difference = ArithExpr.difference(sum, two)
//
//func calculate(_ expr: ArithExpr) -> Int {
//    switch expr {
//    case let .number(value):
//        return value
//    case let .sum(left, right):
//        return calculate(left) + calculate(right)
//    case let .difference(left, right):
//        return calculate(left) - calculate(right)
//    }
//}
//
//calculate(difference)

/*
 MemoryLayout
 可以用MemoryLayout 获取数据类型占用的内存大小
 */

enum Password1 {
    case number(Int, Int, Int, Int)
    case other
}

MemoryLayout<Password1>.stride // 40 分配占用的空间大小
MemoryLayout<Password1>.size // 33 实际用到的空间大小
MemoryLayout<Password1>.alignment // 8 对齐参数

var pwd1 = Password1.number(9, 8, 6, 4)
pwd1 = Password1.other
MemoryLayout.stride(ofValue: pwd1) // 40
MemoryLayout.size(ofValue: pwd1) // 33
MemoryLayout.alignment(ofValue: pwd1) // 8
//: [Next](@next)

//: [Next](@next)

//: [Next](@next)

//: [Next](@next)

//: [Next](@next)

//: [Next](@next)

//: [Next](@next)


