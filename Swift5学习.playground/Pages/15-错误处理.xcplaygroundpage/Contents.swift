//: [Previous](@previous)

import Foundation

enum SomeError: Error {
    case illeagelArg(String)
    case outOfBounds(Int, Int)
    case outOfMemory
}

func divide(_ num1: Int, _ num2: Int) throws -> Int {
    if num2 == 0 {
        throw SomeError.illeagelArg("0 不能作为除数")
    }
    return num1 / num2
}
var res = try divide(1, 2)
print("ok")

func test () {
    print("1")
    do {
        print("2")
        print(try divide(20, 0))
        print("3")
    } catch let SomeError.illeagelArg(msg) {
        print("参数异常：",  msg)
    } catch let SomeError.outOfBounds(size, index) {
        print("下标越界：", "size = \(size)", "index = \(index)")
    } catch SomeError.outOfMemory {
        print("内存溢出")
    } catch {
        print("其他异常")
    }
    print("4")
    
    do {
        try divide(10, 0)
    } catch let error {
        switch error {
        case let SomeError.illeagelArg(msg):
           print("参数异常：",  msg)
        default:
            print("其他异常")
        }
    }
    print("5")
}

test()
print("===== ")


func test2() throws {
    print(1)
    print(try divide(10, 0))
    print(2)

}

//try test2()

print("===== ")

func test3() throws {
    print(1)
    
    var res1 = try? divide(20, 10)
    var res2 = try? divide(20, 0)
    var res3 = try! divide(20, 10)

    print(2)
}
try! test3()

func open (_ filename: String) -> Int {
    print("open")
    return 0
}

func close (_ file : Int) {
    print("close")
}

func processFile(_ filename: String) throws {
    let file = open(filename)
    defer {
        close(file)
    }
    try divide(10, 0)
    
}

try? processFile("test.txt")

func fn1(){print("fn1")}
func fn2(){print("fn2")}
func test4(){
    defer { fn1() }
    defer { fn2() }

}
test4()

func test5 (_ num: Int) -> Int {
    if num >= 0 {
        return 1
    }
    fatalError("num不能小于0")
}

//try? test5(-21)

class Person { required init(){} }
class Studnt: Person {
    required init() {
        fatalError("不要调用这个init")
    }
    init(score: Int) {}
}

var stu1 = Studnt(score: 9)
var stu2 = Studnt()
