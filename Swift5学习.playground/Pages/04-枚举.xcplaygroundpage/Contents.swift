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
//: [Next](@next)

