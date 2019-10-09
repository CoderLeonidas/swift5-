//: [Previous](@previous)

import Foundation

protocol Drawable {
    func draw()
    var x: Int {get set}
    var y: Int {get }
    subscript(index: Int) -> Int {get set}
    init(x: Int, y: Int)
}

protocol Test1{}
protocol Test2{}
protocol Test3{}
class TestClass: Test1, Test2, Test3 {}

class Person: Drawable {
    var x: Int = 0
    let y: Int = 0
    func draw() {
        print("Person draw!!")
    }
    required init(x: Int, y: Int) {
        self.x = x
    }
    subscript(index: Int) -> Int {
        set {}
        get {index}
    }
}

class Person1: Drawable {
    var x: Int {
        get {0}
        set {}
    }
    var y: Int {0}
    
    required init(x: Int, y: Int) {
        self.x = x
    }
    
    func draw() {
        print("Person draw!!")
    }
    subscript(index: Int) -> Int {
        set {}
        get {index}
    }
}

final class Size: Drawable {
    var x: Int = 1
    
    var y: Int = 1
    
    subscript(index: Int) -> Int {
        get {
            <#code#>
        }
        set {
            <#code#>
        }
    }
    
    func draw() {
        <#code#>
    }
    
   
    
    init(x: Int, y: Int) {
        
    }
}

//class Size2: Size {}

protocol Livable {
    init(age: Int)
}

class Person2 {
    init(age:Int) {
        
    }
}

class Student: Person2, Livable {
     required override init(age:Int) {
        super.init(age: age)
    }
}

protocol Runable {}

func fn0(obj: Person) {}

func fn1(obj: Livable) {}

func fn2(obj: Livable & Runable) {}

func fn3(obj: Livable & Runable & Person) {}

//func fn4(obj: Livable & Runable & Person & Person1) {}

typealias RealPerson = Livable & Runable & Person
func fn5(obj: RealPerson) {}


enum Season : CaseIterable {
    case spring, summer, autumn, winter
}

let seasons  = Season.allCases
print(seasons.count)

for season in seasons {
    print(season)
}

class Person3 : CustomStringConvertible, CustomDebugStringConvertible {

    var age = 0
    
    var description: String {"person_\(age)"}
    
    var debugDescription: String {
        "debug_person_\(age)"
    }
}
var per = Person3()
per.age = 90
print(per)
debugPrint(per)

var stu : Any = 10
stu = "Leo"
stu = Student(age: 10)

var data = [Any]()
data.append(1)
data.append(2.0)
data.append("2.0")
data.append(stu)
data.append({10})


protocol Runnable2 {
    func run()
}

class Person5 {}
class Man: Person5, Runnable2 {
    func run() {
        print("Man run")
    }
    
    func study() {
        print("Man study")
    }
}

var man: Any = 10
(man as? Man)?.study()


print(man is Int)
man = "Jacc"
print(man is String)
man = Man()
(man as? Man)?.study()
(man as! Man).study()
(man as? Runnable2)?.run()

print(man is Man)
print(man is Person5)
print(man is Runnable2)

var data2 = [Any]()
data2.append(Int("123") as Any)
data2.append(Int("234") as Any)

print(data2)
print(data2)


var d = 10 as Double
print(d)


var perType : Person.Type = Person.self
var stuTyep : Student.Type = Student.self
//perType = Student.self

var anyType: AnyObject.Type = Person.self
anyType = Student.self

public typealias AnyClass = AnyObject.Type
var anyType2 : AnyClass = Person.self
anyType2 = Student.self

var per2 = Person3()
var perType2 = type(of: per2)
print(Person3.self == type(of: per2))


class Animal {
    required init(){}
}
class Cat: Animal {
    required init() {
        print("Cat init")
    }
}
class Dog: Animal {
    required init() {
        print("Dog init")
    }
}
class Pig: Animal {
    required init() {
        print("Pig init")
    }
}

func create(_ animalClasses: [Animal.Type]) -> [Animal] {
    var animals = [Animal]()
    for cls in animalClasses {
        animals.append(cls.init())
    }
    return animals
}

print(create([Cat.self, Dog.self, Pig.self]))

print(class_getInstanceSize(Pig.self))
print(class_getSuperclass(Pig.self)!)
print(class_getSuperclass(Animal.self) as Any)
