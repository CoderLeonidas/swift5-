//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class Point {
    var x = 0.0, y = 0.0
    subscript(index: Int) -> Double{
        set {
            if index == 0 {
                x = newValue
            } else if index == 1 {
                y = newValue
            }
        }
        get {
            if index == 0 {
                return x
            } else if index == 1 {
                return y
            }
            return 0
        }
    }
}

var p = Point()
p[0] = 4
p[1] = 34

print(p.x)
print(p.y)
print(p[0])
print(p[1])



class Point1 {
    var x = 0.0, y = 0.0
    subscript(index i : Int) -> Double{
        set {
            if i == 0 {
                x = newValue
            } else if i == 1 {
                y = newValue
            }
        }
        get {
            if i == 0 {
                return x
            } else if i == 1 {
                return y
            }
            return 0
        }
    }
}

var p1 = Point1()
p1[index: 0] = 4000
p1[index: 1] = 40

class Sum {
    static subscript(v1: Int, v2: Int) -> Int {
        return v1 + v2
    }
}
print(Sum[10, 20])


class Point2 {
    var x = 0.0, y = 0.0
}

class PointManager_Point2 {
    var point = Point2()
    subscript(i: Int) -> Point2 {
        get {
            point
        }
    }
}

var pm = PointManager_Point2()
pm[0].x = 11
pm[0].y = 22
print(pm[0].x, pm[0].y)
print(pm.point.x, pm.point.y)


struct Point3 {
    var x = 0.0, y = 0.0
}

class PointManager_Point3 {
    var point = Point3()
    subscript(i: Int) -> Point3 {
        get {
            point
        }
        set {
            point = newValue
        }
    }
}


var pm1 = PointManager_Point3()
pm1[0].x = 11
pm1[0].y = 22
print(pm1[0].x, pm1[0].y)
print(pm1.point.x, pm1.point.y)


class Grid {
    var data = [
        [0,1,2],
        [3,4,5],
        [6,7,8]
    ]
    subscript(row: Int, column: Int) -> Int {
        set {
            guard row >= 0 && row < 3 && column >= 0 && column < 3 else {
                return
            }
            data[row][column] = newValue
        }
        get {
            guard row >= 0 && row < 3 && column >= 0 && column < 3 else {
                return 0
            }
            return data[row][column]
        }
    }
}
var grid = Grid()
grid[0,1] = 77

print(grid.data)



