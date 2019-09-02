
import Foundation

/*
 可选项，一般也叫做可选类型，它允许将值设置为nil
 在类型名称后面加个问号’?‘ 来定义一个可选项
 */

var name: String? = "Jack"
name = nil // 如果没有？，则报错"'nil' cannot be assigned to type 'String'"


var age: Int? // 默认值就是nil
age = 10
age = nil

var array = [1,15,40,29]
func get(_ index: Int)-> Int?  {
    if (index < 0 || index >= array.count) {
        return nil
    }

    return array[index]
}
print(get(1))
print(get(-1))
print(get(4))

/*
 强制解包 forced unwrapping
 可选项是对其他类型的一层封装，也可以将它理解为一个盒子
 如果为nil，那么它是个空盒子
 如果不为nil，那么盒子里装的是：被包装类型的数据
 
 var age: Int? // 默认值就是nil
 age = 10
 age = nil
 
 
 */


// 如果要从可选项中取出被包装的数据(将盒子里的东西取出开),需要使用感叹号'!'，进行强制解包

var age1: Int? = 10
var ageInt: Int = age1!
ageInt += 10

// 如果对值为nil 的可选项(空盒子)进行强制解包，将会产生运行时错误  ：Fatal error: Unexpectedly found nil while unwrapping an Optional value
//var age2: Int ?
//age!

// 判断可选项是否包含值

let number = Int("123")
if number != nil {
    print("字符串转换整数成功：\(number!)")
    // number 是强制解包之后的Int值
    // number的作用域仅限于这个大括号
} else {
    print("字符串转换整数失败")
}

/*
  可选项值绑定
 
 可以使用可选项绑定来判断可选项是否包含值
 如果包含就自动解包，把值赋值给一个临时的常量let或者变量var，并返回true，否则返回false
 */

enum Season: Int {
    case spring = 1, summer, autumn, winter
}

if let season = Season(rawValue: 6) {
    switch season {
    case .spring:
        print("the season is spring")
    default:
        print("the season is other")
    }
} else {
    print("no such season")
}

/*
 以下两种写法是等价的
 */

if let first = Int("4") {
    if let second = Int("42") {
        if first < second && second < 100 {
            print("\(first) < \(second) < 100")
        }
    }
}

if let first = Int("4"), let second = Int("42"), first < second && second < 100 {
    print("\(first) < \(second) < 100")

}

/*
 while循环中使用可选项值绑定

 */
// 遍历数组，将遇到的整数都加起来，如果遇到负数或者非数字，则停止遍历
var strs = ["10", "20", "abc", "-20", "30"]
var index = 0
var sum = 0
while let num = Int(strs[index]), num > 0 {
    sum += num
    index += 1
}
print(sum)

/*
 空合并运算符 ?? （nil - coalescing operator）
1 a ?? b
 11 a是可选项
 12 b是可选项 或者 不是可选项
 13 b和a的存储类型必须相同

2 如果a 不为nil，就返回a
3 如果a 为nil，就返回b
4 如果b不是可选项，返回a时会自动解包
 */


//: [Next](@next)
