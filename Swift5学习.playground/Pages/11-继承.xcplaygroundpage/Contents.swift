//: [Previous](@previous)

import Foundation

/*
 1 值类型(枚举，结构体)不支持继承，只有类支持继承
 2 没有父类的类，称为基类
 Swfit没有像OC、java那样的规定：任何类最终都要继承自某个基类
 3 自乐可以重写父类的下标、方法、属性，重写必须加上'override'关键字
 */

/*
 重写实例方法、下标
 
 */
class Animal {
    func speak () {
        print("Animal speak")
    }
    subscript(index: Int) -> Int {
        return index
    }
}

var anim: Animal
anim = Animal()
anim.speak()
print(anim[6])

class Cat: Animal {
    override func speak() {
        super.speak()
        print("Cat speak")
    }
    override subscript(index: Int) -> Int {
        return super[index] + 1
    }
}

anim = Cat()
anim.speak()
print(anim[6])

// 被class修饰的类型的方法、下标，允许被子类重写
// 被static修饰的类型方法、下标，不允许被子类重写

// ??? 下标不允许被修饰为class 和static

class Animal1 {
    class func speak () {
        print("Animal speak")
    }
}

class Cat1: Animal1 {
    override class func speak() {
        super.speak()
        print("Cat1 speak")
    }
}
Cat1.speak()

/*
 重写属性

 1 子类可以将父类的属性(存储、计算)重写为计算属性
 2 子类不可以将父类属性重写为存储属性
 3 只能重写var 属性，不能重写let属性
 4 重写时，属性名、类型要一直
 5 子类重写后的属性权限，不能小于父类属性的权限
    51 如果父类属性是只读的，那么子类重写后的属性可以是只读的，也可以是可读写的
    52 如果父类属性是可读写的，那么子类重写后的属性也必须是可读写的
 */


//重写实例属性
class Circle {
    var radius: Int = 0
    var diameter: Int {
        set {
            print("Crcle setDiameter")
            radius = newValue / 2
        }
        get {
            print("Crcle getDiameter")
            return radius * 2
        }
    }
}

var circle: Circle
circle = Circle()
circle.radius = 6
print(circle.diameter)
print(circle.radius)

class SubCircle: Circle {
    override var radius: Int {
        set {
            print("SubCircle setRadius")
            super.radius = newValue > 0 ? newValue : 0
        }
        get {
            print("SubCircle getRadius")
            return super.radius
        }
    }
    
    override var diameter: Int {
        set {
            print("SubCircle setDiameter")
            super.diameter = newValue > 0 ? newValue : 0

        }
        get {
            print("SubCircle getDiameter")

            return super.diameter
        }
    }
}

circle = SubCircle()
circle.radius = 6
print(circle.diameter)
circle.diameter = 20
print(circle.radius)

// 被class 修饰的计算类型属性，可以被子类重写
// 被static修饰的类型属性(存储、计算)，不可以被子类重写


class Circle2 {
    static var radius: Int = 0
    class var diameter: Int {
        set {
            print("Circle2 setDiameter")
            radius = newValue / 2
        }
        get {
            print("Circle2 getDiameter")
            return radius * 2
        }
    }
}

class SubCircle2: Circle2 {
    override static var diameter: Int {
        set {
            print("SubCircle2 setDiameter")
            super.diameter = newValue > 0 ?  newValue : 0
        }
        get {
            print("SubCircle2 getDiameter")
            return super.diameter
        }
        
    }
}

print("===========")
Circle2.radius = 6
print(Circle2.diameter)
Circle2.diameter = 20
print(Circle2.radius)

SubCircle2.radius = 6
print(SubCircle2.diameter)
SubCircle2.diameter = 20
print(SubCircle2.radius)


/*
 属性观察器
 可以在子类中为父类(除了只读计算属性，let属性)属性增加属性观察器
 
 */
print("===========")

class XXXClass {
    var xxxVar: Int = 1

}
class SubXXXClass: XXXClass {
    override var xxxVar: Int {
        willSet {
            print("SubXXXClass willSet xxxVar \(newValue)")
        }
        didSet {
            print("SubXXXClass didSet xxxVar \(oldValue)  \(xxxVar)")

        }
    }
}

var xxx = SubXXXClass()
xxx.xxxVar = 10

// 父类属性为存储属性，为其子类添加属性观察器
print("===========")
class XXXClass1 {
    var xxxVar: Int = 1 {
        willSet {
            print("XXXClass1 willSet \(newValue)")
        }
        didSet {
            print("XXXClass1 didSet \(oldValue) \(xxxVar)")

        }
    }
}
class SubXXXClass1: XXXClass1 {
    override var xxxVar: Int {
        willSet {
            print("SubXXXClass1 willSet xxxVar \(newValue)")
        }
        didSet {
            print("SubXXXClass1 didSet xxxVar \(oldValue)  \(xxxVar)")
            
        }
    }
}

var xxx1 = SubXXXClass1()
xxx1.xxxVar = 10



// 父类属性为计算属性，为其子类添加属性观察器
print("===========")
class XXXClass2 {
    var xxxVar: Int  {
        set {
            print("XXXClass2 set \(newValue)")
        }
        get {
            print("XXXClass2 get")
            return 20
            
        }
    }
}
class SubXXXClass2: XXXClass2 {
    override var xxxVar: Int {
        willSet {
            print("SubXXXClass2 willSet xxxVar \(newValue)")
        }
        didSet {
            print("SubXXXClass2 didSet xxxVar \(oldValue)  \(xxxVar)")
            
        }
    }
}


var xxx2 = SubXXXClass2()
xxx2.xxxVar = 10


// 父类属性为class修饰的计算属性，为其子类添加属性观察器
print("===========")
class XXXClass3 {
    class var xxxVar: Int  {
        set {
            print("XXXClass3 set \(newValue)")
        }
        get {
            print("XXXClass3 get")
            return 20
            
        }
    }
}
class SubXXXClass3: XXXClass3 {
    override class var xxxVar: Int {
        willSet {
            print("SubXXXClass3 willSet xxxVar \(newValue)")
        }
        didSet {
            print("SubXXXClass3 didSet xxxVar \(oldValue)  \(xxxVar)")
            
        }
    }
}

SubXXXClass3.xxxVar = 10

/*
 final
 1  被final 修饰的方法、下标、属性，禁止被重写
 2  被final 修饰的类，禁止被继承
 */
