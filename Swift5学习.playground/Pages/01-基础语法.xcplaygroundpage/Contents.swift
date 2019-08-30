//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport


/*
 1 不用编写main函数，swift将全局范围内的第一句可执行代码作为程序入口
 2 一句代码尾部可以省略分号(;)，多句代码写到同一行时，必须用分号(;)隔开
 3 用var定义变量，let定义常量，编译器能自动推断出变量\常量的类型
 4 playground可以快速预览代码效果，是学习语法的好帮手
 5 cmd + shift + enter ：运行整个playground
 6 shift + enter：运行截止到某一行代码
 */

let a = 10
let b = 20
var c = a + b
c += 30



/// playground-view
let view = UIView()
view.frame = CGRect(x:0,y:0,width:100,height:100)
view.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = view

let imageView = UIImageView(image:UIImage(named:"logo"))
PlaygroundPage.current.liveView = imageView

/// playground-viewController
let vc = UITableViewController()
vc.view.backgroundColor = UIColor.blue
PlaygroundPage.current.liveView = vc

/*
 常量
 1 只能被赋值一次
 2 他的值不要求在编译时期确定，但使用之前必须要赋值一次

 */

let age1 = 10
let age2: Int
age2 = 10

func getAge() -> Int {
    return 30
}

let age3 = getAge()

// 常量、变量在初始化之前，都不能使用
//let age: Int
//var height: Int
//print(age)
//print(height)


// 下面代码是错误的
//let age
//age = 20

/*
 常见数据类型
 值类型：枚举(Optional)和结构体(Bool\Int\Float\Double\Character\String\Array\Dictionary\Set)
 引用类型：类(Class)
 
 整数类型： Int8、Int16、Int32、Int64、UInt16、UInt32、UInt64
 在32bit平台，Int等价于Int32，在64bit平台，Int等价于Int64
 整数的最值：UInt8.max、UInt8.min
 一般情况下，都是直接使用Int即可
 
 浮点类型：Float32位，精度只有6位；Double，64位，精度至少15位
 
 */


/*
 标识符
 1 标识符(比如常量名、变量名、函数名)几乎可以使用任何字符
 2 标识符不能以数字开头，不能包含空白字符、制表符、箭头等特殊字符

 */

func 🐂🍺 () {
    print("666")
}

🐂🍺()

let 👽 = "ET"
var 🥛 = "milk"



/*
 字面量
 */
// 布尔值
let bool  = true
// 字符串
let string = "小码哥"
// 字符，可存储ASCII字符、Unicode字符
let character:Character = "🐶"

//整数
let intDecimal = 17// 十进制
let intBinary = 0b1001 // 二进制
let intOctal = 0o21 // 八进制
let intHexadecimal = 0x11 // 十六进制
// 浮点数
let doubleDecimal = 125.0// 十进制，等价于1.25e2，0.0125等价于1.25e-2
let doubleHexadecimal1 = 0xFp2 // 十六进制，等价于15x2^2,相当于十进制的60.0
let doubleHexadecimal2 = 0xFp-2 // 十六进制，等价于15x2^-2,相当于十进制的3.75

// 整数和浮点数可以添加额外的零或者添加下划线来增强可读性
let intHuge = 100_000_000
let floatHuge = 1_000_000.000_000_1

// 数组
let array = [1,2,3,4,5]

// 字典
let dictionary = ["age":29, "height":180]

// 类型转换
// 整数转换
let int1: UInt16 = 2_00
let int2: UInt8 = 1
let int3 = int1 + UInt16(int2)

// 整数、浮点数转化
let int = 3
let double = 0.1415926
let pi = Double(int) + double
let intPi = Int(pi)

// 字面量可以直接相加，以为数字字面量本身没有明确的类型
let result = 3 + 0.1415926


// 元组(Tuple)
let http404Error = (404, "Not Found")
print("the status code is \(http404Error.0)")
print("the reason is \(http404Error.1)")

let (statusCode, statusMessage) = http404Error
print("ths status code is \(statusCode)")

let (justTheStatusCode, _) = http404Error
print("ths status code is \(justTheStatusCode)")

let http200Status = (statusCode: 200, description:"OK")
print("The status code is \(http200Status.statusCode)")








//: [Next](@next)
