
//: [Previous](@previous)

import Foundation

/*
 函数的定义
 func 函数名(参数1： 参数1类型, 参数2：参数2类型 ...) -> 返回值类型 {
 
 }
 
 */

// 有返回值
func pi() -> Double {
    return 3.14
}

func sum(v1: Int, v2: Int) -> Int {
    return v1 + v2
}
sum(v1: 10, v2: 20)

// 形参默认是let，也只能是let

// 无返回值
func sayHello() -> Void {
    print("hello")
}

func sayHello2() -> () {
    print("hello")
}

func sayHello3() {
    print("hello")
}

/*
 隐式返回(implicit return)
 */

// 如果整个函数体是一个单一表达式，那么函数会隐式返回这个表达式 ??? 编译无法通过
//func sum2(v1: Int, v2: Int) -> Int {
//    v1 + v2
//}
//sum2(v1: 10, v2: 20)


/*
 返回元祖：实现多返回值

 */



func calculate(v1: Int, v2: Int) -> (sum: Int, difference: Int, average: Int) {
    let sum = v1 + v2
    return (sum, v1 - v2, sum >> 1)
}

let result = calculate(v1: 20, v2: 10)
result.sum
result.difference
result.average

/*
 函数的文档注释
 */


/// myFunc
///
/// - Parameters:
///   - v1: v1 description
///   - v2: v2 description
/// - Returns: return value description
/// - Note: XXX
func myFunc(v1: String, v2: String) -> String {
    
    return v1 + v2
}

/*
参数标签 (Argument label)
 */
// 可以修改参数标签
func goToWork(at time : String) {
    print("this time is \(time)")
}
goToWork(at: "8:00")

// 可以使用下划线_ 省略参数标签
func sum3(_ v1: Int, _ v2: Int) -> Int {
    return v1 + v2
}
sum3(10, 20)

/*
 默认参数值 (Default Parameter Value)
 */

// 参数可以有默认值
func check(name: String = "nobody", age: Int, job: String = "none") {
    print("name = \(name), age = \(age), job = \(job)")
}

check(name: "Jack", age: 20, job: "Doctor")
check(name: "Rose", age: 18)
check(age: 10, job: "Batman")
check(age: 15)

// C++的默认参数值有个限制： 必须从右往左设置。由于swift拥有参数标签，因此并没有此类限制
// 但是在省略参数标签时，特别需要注意，避免出错
func test(_ first: Int = 10,  middle: Int, _ last: Int = 30) {}
// 这里的middle 不能省略参数标签
test(middle: 20)

/*
 可变参数
 */

func sum4(_ numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}
sum4(10,20,30,40)

// 一个函数最多只能有1个可变参数
// 紧跟在可变参数后面的参数不能省略参数标签
func test2(_ numbers: Int..., string: String, _ other: String) {}
test2(10,20,30, string: "Jack", "Rose")

// Swift 自带的print函数
/// - Parameters:
///   - items: Zero or more items to print.
///   - separator: A string to print between each item. The default is a single
///     space (`" "`).
///   - terminator: The string to print after all items have been printed. The
///     default is a newline (`"\n"`).
//public func print(_ items: Any..., separator: String = " ", terminator: String = "\n")

print(1,2,3,4,5)
print(1,2,3,4,5, separator: "_")

print("My name is Jake", terminator: "")
print("My age is 18.")

/*
 输入输出参数
 */

// 可以用inout 定义一个输入输出参数：可以在函数内部修改外部实参

func swapValues(_ v1: inout Int, _ v2: inout Int) {
    let tmp = v1
    v1 = v2
    v2 = tmp
}

var num1 = 10
var num2 = 20
swapValues(&num1, &num2)

// 可变参数不能标记为inout
// inout参数不能有默认值
// intou参数只能传入可以被多次赋值的值
// inout参数的本质是地址传递（引用传递）

func swapValues2(_ v1: inout Int, _ v2: inout Int) {
    (v1, v2) = (v2, v1)
}
num1 = 30
num2 = 40
swapValues2(&num1, &num2)
print(num1,num2)


/*
 函数重载
 规则：
 1 函数名相通
 2 参数个数不同|| 参数类型不同|| 参数标签不同
 */

func add(v1: Int, v2: Int) -> Int {
    print("func add(v1: Int, v2: Int) -> Int")
    return v1 + v2
}

func add(v1: Int, v2: Int, v3: Int) -> Int {
    print("func add(v1: Int, v2: Int, v3: Int) -> Int")

    return v1 + v2 + v3
}// 参数个数不同

func add(v1: Int, v2: Double) -> Double {
    print("func add(v1: Int, v2: Double) -> Double")

    return Double(v1) + v2
} // 参数类型不同


func add(_ v1: Int, _ v2: Int) -> Int {
    print("func add(_ v1: Int, _ v2: Int) -> Int")

    return v1 + v2
} // 参数标签不同

func add(a: Int, b: Int) -> Int {
    print("func add(a: Int, b: Int) -> Int")
    return a + b
}// 参数标签不同

/*
 重载注意点
 */
// 返回值类型与函数重载无关 ?? 下面函数编译通过，但不会被调用
//func add(v1: Int, v2: Int)  {
//    print("add: \(v1+v2)")
//}
//add(10, 20)

// 默认参数值和函数重载一起使用产生二义性时，编译器并不会报错(C++中会报错) ?? 会报错

//func add(v1: Int, v2: Int, v3: Int = 10) -> Int {
//    print("func add(v1: Int, v2: Int, v3: Int = 10) -> Int")
//    return v1 + v2 + v3
//}
//add(10, 20)

// 可变参数、省略参数标签、函数重载一起使用产生二义性时，编译器有可能会报错
//func add(_ numbers: Int...) -> Int {
//    print("func add(_ numbers: Int...) -> Int")
//    var total = 0
//    for number in numbers {
//        total += number
//    }
//    return total
//
//}
//
//add(10,20)

/*
 内联函数
 1 如果开启了编译器优化(Release模式会开启优化)，编译器会自动将某些函数变成内联函数
 2 将函数调用展开成函数体
 3 编译器设置在 buildsetting - swift compiler - code generation中的 Optimization Level
 4 哪些函数不会被自动l内联？
  41 函数体比较长
  42 包含递归调用
  43 包含动态派发
 
 5 在release模式下，编译器已经开启优化，会自动决定哪些函数需要内联，因此眉笔还要使用@inline
 */

/*
 @inline 关键字
 never: 永远不会被内联，即使开启了编译器优化
 __always: 开启编译器优化后，即使代码很长，也会被内联，递归调用函数，动态派发的函数除外
 */
@inline(never) func XXX() {
}

@inline(__always) func XXXXX () {
    
}

/*
 函数类型
 每一个函数都是有类型的，函数类型由形参类型、返回值类型组成
 */

func aaa() {}// ()-> Void 或者 () -> ()
func bbb(a: Int, b: Int) -> Int {
    return a+b
}// (Int, Int) -> Int

//  用函数类型来定义变量
var fn: (Int, Int) -> Int = bbb
fn(2,3) // 调用时不需要参数标签, 不用形似：fn(a: 1, b: 2)

/*
 函数类型作为函数参数
 */

func ccc(a: Int, b: Int) -> Int {
    return a + b
}

func ddd(a: Int, b: Int) -> Int {
    return a - b
}

func printResult(_ mathFn: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFn(a,b))")
}
printResult(ccc, 5, 2)
printResult(ddd, 5, 2)

/*
 函数类型作为函数返回值
 
 返回值是函数类型的函数，叫做高阶函数
 */

func next(_ input: Int) -> Int {
    return input + 1
}

func previous(_ input: Int) -> Int {
    return input - 1
}

func forwark(_ forward: Bool) -> (Int) -> Int {
    return forward ? next : previous;
    
}
forwark(true)(3)
forwark(false)(3)


/*
 typealias
 typealias 用来给类型起别名
 
 typealias Byte = Int8
 typealias Short = Int16
 typealias Long = Int32
 
 按照Swift标准库的定义，Void就是空元组
 */

typealias Date = (year: Int, month: Int, day: Int)
func testDate(_ date: Date) {
    print(date.0)
    print(date.year)
}

testDate((2011,9,10))

typealias IntFn = (Int, Int) -> Int
func diff(v1: Int, v2: Int) -> Int {
    return v1 - v2
}

let FN: IntFn = diff
FN(10, 20)

func setFn(_ fn: IntFn) {}
setFn(diff)

func getFn () -> IntFn {
    return diff
}
getFn()

/*
 嵌套函数
 将函数定义在函数内部
 */

func forward(_ forward: Bool) -> (Int) -> Int {
    func next(_ input: Int) -> Int {
        return input + 1
    }
    
    func previous(_ input: Int) -> Int {
        return input - 1
    }
    
    return forward ? next : previous
}

forward(true)(3)
forward(false)(3)




