//: [Previous](@previous)

import Foundation

func sum(_ v1: Int, _ v2: Int) -> Int {v1 + v2}

print(sum(10, 20))

var fn = {
    (v1:Int, v2:Int) -> Int in
    return v2 + v1
}

fn(10, 20)

func exec(v1: Int, v2: Int, fn:(Int, Int) -> Int) {
    print(fn(v1, v2))
}

exec(v1: 10, v2: 20) { (v1: Int, v2: Int) -> Int in
    return v2 + v1
}

exec(v1: 10, v2: 20, fn: {$0 + $1})

exec(v1: 10, v2: 20, fn:+)

exec(v1: 10, v2: 20, fn: {
    v1, v2 in return v1 + v2
})


func cmp(i1: Int, i2: Int) -> Bool {
    return i1 > i2
}

var nums = [11,22,33,44,55,66,77,88]

//nums.sort(by: cmp)

nums.sort(by: {
    (i1: Int , i2: Int) -> Bool in
    return i1 < i2
})

nums.sort(by: {i1, i2 in return i1 < i2})

nums.sort(by: {i1, i2 in i1 < i2})


nums.sort(by: { $0 < $1})

nums.sort(by: <)

nums.sort() { $0 < $1}


typealias Fn = (Int) -> Int
//var num: Int = 0
func getFn() -> Fn {
    var num: Int  = 0
    func plus(_ i: Int) -> Int {
        num += i
        return num
    }
    return plus
}

var fn1 = getFn()
var fn2 = getFn()
fn1(1)
fn1(2)
fn1(3)
fn1(4)

fn2(1)
fn2(2)
fn2(3)
fn2(4)

typealias bibao = () -> Int
var functions: [bibao] = []

for i in 1...3 {
    functions.append({i})
    functions.append({i+10})


}

for f in functions {
    print(f())
}


class Closure {
    var i: Int
    init(_ i: Int) {
        self.i = i
    }
    func get() -> Int {
        return i
    }
}

var clses: [Closure] = []
for i in 1...3 {
    clses.append(Closure(i))
}

for cls in clses {
    print(cls.get())
}

func add(_ num: Int) -> (inout Int) -> Void {
    func plus(v: inout Int) {
        v += num
    }
    return plus
}
var num = 5
add(20)(&num)
print(num)

func getFirstPositive(_ v1: Int, _ v2: Int) -> Int {
    return v1 > 0 ? v1 : v2
}

getFirstPositive(10, 20)
getFirstPositive(-10, 20)
getFirstPositive(0, 20)


func getFirstPositive2(_ v1: Int, _ v2: () -> Int ) -> Int? {
    return v1 > 0 ? v1 : v2()
}
getFirstPositive2(-4) { 20 }

func getFirstPositive3(_ v1: Int, _ v2: @autoclosure () -> Int ) -> Int? {
    return v1 > 0 ? v1 : v2()
}
getFirstPositive3(-4, 20)
