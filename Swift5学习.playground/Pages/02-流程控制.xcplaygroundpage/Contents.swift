import UIKit

/*
 if-else
 1 if后面的条件可以省略小括号
 2 条件后面的大括号不能省略
 */
let age = 4
if age >= 22 {
    
}  else {
    
}
// if后面的条件只能是bool类型
//if age {
//
//}


/*
 while
 */

var num = 5
while num > 0 {
    print("num is \(num)")
    num -= 1
}
var num2 = -1
repeat {
    print("num2 is \(num2)")
} while num > 0
// repeat-while相当于C语言中的do-while
// 这里不用num--是因为： 从swift3开始看，去除了自增++和自减-- 运算符

/*
 for
 */

// 闭区间运算符: a...b , a <= 取值 <= b
let names = ["A", "B", "C", "D", "E"]
for i in 0...3 {
    print("\(names[i])")
}

let range = 1...4
for i in range {
    print("\(names[i])")
}

for var j in 0...3 {
    j+=5
    print(j)
}

for _ in 0...3 {
    print("for")
}

let a = 1
var b = 2
for i in a...b {
    print(names[i])
}

for j in a...3 {
    print(names[j])
}
// 半开区间运算符： a..<b , a<= 取值 < b
for i in 1..<5 {
    print(i)
}

// for - 区间运算符用在数组上
for name in names[0...3] {
    print(name)
}

// 单侧区间：让区间朝一个方向尽可能的远
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[0..<2] {
    print(name)
}

range.contains(7) // false
range.contains(4) // true
range.contains(-3) // false

/*
 区间类型
 */
let range1: ClosedRange<Int> = 1...3
let range2: Range<Int> = 1..<3
let range3: PartialRangeThrough<Int> = ...5
// 字符，字符串也能使用区间运算符，但默认不能用在for-in中
let stringRange1 = "cc"..."ff" // ClosedRange<String>
stringRange1.contains("cb") // false
stringRange1.contains("dz") // true
stringRange1.contains("fg") // false

let stringRange2 = "a"..."f"
stringRange2.contains("d") // true
stringRange2.contains("h") // false

// \0到~ 囊括了所有可能要用到的ASCII字符
let characterRange: ClosedRange<Character> = "\0"..."~"
characterRange.contains("G")// true

/*
 带间隔的区间
 */
let hour = 11
let hourInterval = 2
// tickMark的取值： 从4开始，累加2，不超过11
for tickMark in stride(from: 4, to: hour, by: hourInterval) {
    print(tickMark)
}

/*
 switch
 */
var number = 1
switch number {
case 1:
    print("number is 1")
    break
case 2:
    print("number is 2")
    break
case 3:
    print("number is 3")
    break
default:
    break
}

// case default 后加不能写大括号
// 默认可以不写break，并不会贯穿到后面的条件

switch number {
case 1:
    print("number is 1")
case 2:
    print("number is 2")
case 3:
    print("number is 3")
default:
    print("number is other")

}

/*
 fallthrough
 使用fallthrough可以实现贯穿效果
 */
switch number {
case 1:
    print("number is 1")
    fallthrough
case 2:
    print("number is 2")
default:
    print("number is other")

}


/*
 switch注意点：
 */
// 1 switch必须要博阿正能处理所有情况
//switch number {
//case 1:
//    print("number is 1")
//case 2:
//    print("number is 2")
//
//}

// 2 case \default  后面至少要有一条语句
// 3 如果不想做任何事，价格break
// 4 如果能处理所有情况，可以不使用default

enum Answer {case right, wrong}
let answer = Answer.right

switch answer {
case Answer.right:
    print("right")
case Answer.wrong:
    print("wrong")
}

// 由于已经确定answer是Answer的类型，因此可以省略Andwer
switch answer {
case .right:
    print("right")
case .wrong:
    print("wrong")
}

/*
 复合条件
 */

// switch 也支持Character、String类型
let string = "Jack"
switch string {
case "Jack":
    fallthrough
case "Rose":
    print("right person")
default:
    break
}

switch string {
case "Jack", "Rose":
    print("right person")

default:
    break
}

let character: Character = "a"
switch character {
case "a","A":
    print("the letter A")
default:
    print("Not the letter A")
}


/*
 区间匹配、元祖匹配
 */

let count = 62
switch count {
case 0:
    print("None")
case 1..<5:
    print("a few")
case 5..<12:
        print("several")
case 12..<100:
    print("dozens of")
case 100..<1000:
        print("hundreds of")
default:
    print("many")

}

// 可以使用下划线"_" 来忽略某个值
let point = (1,1)
switch point {
case (0,0):
    print("the origin")
case (_,0):
    print("on the x-axis")
case (0,_):
    print("on the y-axis")
case (-2...2, -2...2):
    print("inside the box")
default:
    print("outside the box")

}

/*
 值绑定
 */

let point2 = (2, 0)
switch point2 {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an x value of \(y)")
case let (x, y):
    print("somewhere else at  (\(x),\(y))")
}

// 必要时let也可以改为var
switch point2 {
case (var x, 0):
    print("on the x-axis with an x value of \(x+1)")
case (0, let y):
    print("on the y-axis with an x value of \(y)")
case let (x, y):
    print("somewhere else at  (\(x),\(y))")
}



/*
 where
 */

let point3 = (1, -1)
switch point3 {
case let(x, y) where x == y:
    print("on the line x == y")
case let(x, y) where x == -y:
    print("on the line x == -y")
case let(x, y):
    print("(\(x), \(y)) is just some arbitrary point")
    
}

// 将所有整数加起来
var nums = [10,20,-10,-20,30,-30]
var sum = 0
for num in nums where num > 0{
    sum+=num
}
print(sum)


/*
 标签语句
 注意：标签后面要加冒号(:)
 */

outer: for i in 1...4 {
    for j in 1...4 {
        if j == 3 {
            continue outer
        }
        if i == 3 {
            break outer
        }
        print("i == \(i), j == \(j)")
    }
}
