//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!!!"
        label.textColor = .black
        
        view.addSubview(label)
        
        let myString = "Hello Argost!1"
        print(myString)
        
        let myStringlabel = UILabel()
        myStringlabel.frame = CGRect(x: 150, y: 240, width: 200, height: 20)
        myStringlabel.textColor = .green
        myStringlabel.text = myString
        
        view.addSubview(myStringlabel)
        
        self.view = view
        let `class` = "Runoob"
        print (`class`)
        
        let theInput = readLine()
        print(theInput as Any)
        
        var myString2:String?

        myString2 = "Hello, Swift!"

        if myString2 != nil {
            print(myString2!)
        } else {
           print("myString2 值为 nil")
        }
        
        let A = 10
        let B = 20
        
        print("a+b=\(A+B)")
        print("a-b=\(A-B)")
            
        let intsA = [Int](repeating: 2, count: 2)
        let intsB = [Int](repeating: 23, count: 2)

        let intsC = intsA + intsB

        for item in intsC {
            print(item)
        }
        print("intsC is Empty=\(intsC.isEmpty)")
        
        var someDict:[Int:String] = [1:"one", 2:"Two", 3:"Three"]
        
        let removeValue = someDict.removeValue(forKey: 2)
        
        print(removeValue!)
        print("key=1 \(String(describing: someDict[1]))")
        print("key=2 \(String(describing: someDict[2]))")
        print("key=3 \(someDict[3]!)")
        
        for value in someDict {
            print(value)
        }
    }
}

func runoob(site: String) -> String {
    return site
}

func pow(firstArg a: Int, secondArg b: Int) -> Int {
    var res = a
    for _ in 1..<b {
        res *= a
    }
    
    print("pow=\(res)")
    return res
}

func vari<N>(members: N...) {
    for i in members {
        //print不换行,结尾以空格结束
        print(i, terminator: " ")
    }
}

func swapTowInts(_ a:inout Int, _ b: inout Int) {
    print("\nbefore: \(a) and \(b)")
    let temporaryA = a
    a = b
    b = temporaryA
    print("after: \(a) and \(b)")
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

print(runoob(site: "www.runoob.com"))

pow(firstArg: 5, secondArg: 3)
vari(members: 1,2,3,4,5)
vari(members: 1.2,3.3,4.4,5.5)
vari(members: "G","M","P")

var x=1
var y=5
swapTowInts(&x, &y)

func sum(a: Int, b: Int)->Int {
    return a+b
}

var addtion: (Int, Int)->Int = sum(a:b:)
print("输出结果：\(addtion(40, 89))")

func another(addtion: (Int, Int)->Int, a: Int, b: Int) {
    let result = addtion(a, b) + a + b + 1
    
    print("Result is: \(result)")
}

another(addtion: addtion, a: 10, b: 20)

//返回值是一个函数，()->Int，所以不需要return decrementer()
func calcDecrement(forDecrement total: Int)->()->Int {
    var overalDecrement = 0
    func decrementer()->Int {
        overalDecrement-=total
        return overalDecrement
    }
    
    return decrementer
}

let decrem = calcDecrement(forDecrement: 30)
print(decrem())

let stuname = {print("Swift 闭包实例")}
stuname()

let divide = {(val1: Int, val2: Int)->Int in
    return val1/val2
}

let result = divide(200, 22)

print(result)

let intAry: [Int] = [1,30,2,-10,-100,24,89,100,-700]

func backwards(n1: Int, n2: Int)->Bool {
    return n1>n2
}

print(intAry.sorted())
print(intAry.sorted(by: backwards))
print(intAry.sorted(by: {$0>$1}))
print(intAry.sorted(by: >))
print(intAry.sorted(){$0>$1})

struct markStruct {
    var mark1: Int
    var mark2: Int
    var mark3: Int
    
    init(mark1: Int, mark2: Int, mark3: Int) {
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}

print("优异成绩：")
var marks = markStruct(mark1: 98, mark2: 96, mark3: 100)
print(marks.mark1)
print(marks.mark2)
print(marks.mark3)

print("糟糕成绩：")
var fail = markStruct(mark1: 34, mark2: 42, mark3: 13)
print(fail.mark1)
print(fail.mark2)
print(fail.mark3)

class SampleClass: Equatable {
    let myProperty: String
    init(s: String) {
        myProperty = s
    }
    
    static func ==(lhs: SampleClass, rhs: SampleClass) -> Bool {
        return lhs.myProperty == rhs.myProperty
    }
}

let spclass1 = SampleClass(s: "Hello")
var spclass2 = SampleClass(s: "Hello")
spclass2 = spclass1

if spclass1 === spclass2 {
    //false
    print("引用相同的类实例 \(spclass2)")
}

if spclass1 !== spclass2 {
    //true
    print("引用不同的类实例 \(spclass2)")
}

class Sample {
    var no1 = 0.0, no2 = 0.0
    var length = 300.0, breadth = 150.0
    
    var middle:(Double, Double) {
        get {
            return (length/2, breadth/2)
        }
        set(axis) {
            no1 = axis.0 - (length/2)
            no2 = axis.1 - (breadth/2)
        }
    }
    
}

var result2 = Sample()
print(result2.middle)
result2.middle = (0.0, 10.0)

print(result2.no1)
print(result2.no2)

class Samplegpm {
    var counter: Int {
        willSet(newTotal) {
            print("计数器： \(newTotal)")
        }
        didSet {
            if counter > oldValue {
                print("新增数 \(counter-oldValue)")
            }
        }
    }
    
    init(counter: Int) {
        self.counter = counter
    }
}

let NewCounter = Samplegpm(counter: 200)
NewCounter.counter = 100
NewCounter.counter = 800

class caculations {
    let a: Int
    let b: Int
    let res: Int
    
    init(first a: Int, b: Int) {
        self.a = a
        self.b = b
        res = a+b
        print("Self 内: \(res)")
    }
    
    func tot(c: Int) -> Int {
        return res-c
    }
    
    func result() {
        print("结果为：\(tot(c: 20))")
        print("结果为：\(tot(c: 50))")
    }
}

let pri = caculations(first: 600, b: 300)
let sum = caculations(first: 1200, b: 300)

pri.result()
sum.result()

class Math {
    class func abs(number: Int) -> Int {
        if number < 0 {
            return -number
        } else {
            return number
        }
    }
}

let no = Math.abs(number: -35)

struct area {
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length*breadth
    }
    
    //这个mutaing比较关键
    mutating func scaleBy(res: Int) {
        length *= res
        breadth *= res
        
        print(length)
        print(breadth)
    }
}

var val = area(length: 3, breadth: 5)
var mm = area()
val.scaleBy(res: 3)
val.scaleBy(res: 30)
val.scaleBy(res: 300)

struct absno {
    static func abs(number: Int) -> Int {
        if number < 0 {
            return -number
        } else {
            return number
        }
    }
}

let num = absno.abs(number: -5)

print(no)
print(num)

struct subexample {
    let decrementer: Int
    subscript(index: Int)->Int {
        return decrementer/index
    }
}

let division = subexample(decrementer: 100)

print("100/9= \(division[9])")

class days_of_week {
    private var days = ["Sun", "M", "T", "W", "T", "F", "Sat"]
    
    subscript(index: Int)->String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
}

var p = days_of_week()
print(p[0])
print(p[2])

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

print(numberOfLegs)

class Circle {
    var radius = 12.5
    var area: String {
        return "\(radius)"
    }
}

class Rectangle: Circle {
    var print = 7
    override var area: String {
        return super.area + ", 现在被重写为\(print)"
    }
}

let rect = Rectangle()
rect.radius = 25.0
rect.print = 3
print("radius \(rect.area)")

struct Rectangle1 {
    var length: Double
    
    init(frombreadth breadth: Double) {
        length = breadth*10
    }
    
    init(fromebre bre: Double) {
        length = bre * 30
    }
    //不提供外部名字
    init(_ area: Double) {
        length = area
    }
}

let rectarea = Rectangle1(180.0)
let rectarea1 = Rectangle1(fromebre: 100.0)
let rectarea2 = Rectangle1(frombreadth: 80.0)

class MainClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown")
    }
}

class SubMainClass: MainClass {
    var count: Int
    init(name: String, count: Int) {
        self.count = count
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, count: 1)
    }
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {return nil}
        self.species = species
    }
}


//通过该可失败构造器来构建一个Animal的对象，并检查其构建过程是否成功
// someCreature 的类型是 Animal? 而不是 Animal
let someCreature = Animal(species: "🦒")
if let giraffe = someCreature {
    print("动物初始化为： \(giraffe.species)")
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Residence {
    var rooms = [Room]()
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int)->Room {
        return rooms[i]
    }
    
    func printNumberOfRooms() {
        print("房间号为 \(numberOfRooms)")
    }
    
    var address: Address?
}

class Person {
    var residence: Residence?
}

let john = Person()
let johnHouse = Residence()
johnHouse.rooms.append(Room(name: "客厅"))
johnHouse.rooms.append(Room(name: "厨房"))
john.residence = johnHouse

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence!.address = johnsAddress

if let firstRoomName = john.residence?[0].name {
    print("第一个房间名 \(firstRoomName)")
} else {
    print("无法检索房间")
}

if let johnsStreet = john.residence?.address?.street {
    print("John 所在的街道是 \(johnsStreet)")
} else {
    print("404")
}

extension Int {
    var add: Int {return self+100}
    var sub: Int {return self-10}
    var mul: Int {return self*10}
    var div: Int {return self/5}
}

let addition = 3.add
print("加法运算后的值: \(addition)")

struct diff {
    var no1 = 200, no2 = 100
}

let b = diff(no1: 200, no2: 100)

protocol classa {
    var marks: Int {get set}
    var result: Bool {get}
    
    func attendance()->String
    func markssecured() -> String
    
    
}

protocol classb: classa {
    var present: Bool {get set}
    var subject: String {get set}
    var stname: String {get set}
    
}

class classc : classb {
    var marks = 96
    let result = true
    var present = false
    var subject = "Swift 协议"
    var stname = "Protocols"
    
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    
    func markssecured() -> String {
        return "\(stname) has scored \(marks)"
    }
}

let studdet = classc()
studdet.stname = "Swift"
studdet.marks = 98
studdet.markssecured()

print(studdet.marks)
print(studdet.result)
print(studdet.present)
print(studdet.subject)
print(studdet.stname)

protocol tcpprotocol {
    init(no1: Int)
}

class mainClass {
    var no1: Int
    init(no1: Int) {
        self.no1 = no1
    }
    
}

class subClass: mainClass, tcpprotocol {
    var no2: Int
    init(no1: Int, no2: Int) {
        self.no2 = no2
        super.init(no1: no1)
    }
    
    required override convenience init(no1: Int) {
        self.init(no1:no1, no2:0)
    }
}

let res = mainClass(no1: 20)
let show = subClass(no1: 30, no2: 50)

print("res is: \(res.no1)")
print("res is: \(show.no1)")
print("res is: \(show.no2)")

protocol Generator {
    associatedtype members
    func next() -> members?
    
    
}


var items = [10,20,30].makeIterator()
while let x = items.next() {
    print(x)
}

for lists in [1,2,3].map({i in i*5}) {
    print(lists)
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var numb1 = 100
var numb2 = 200

print("交换前数据: \(numb1) and \(numb2)")
swapTwoValues(&numb1, &numb2)
print("交换后数据: \(numb1) and \(numb2)")

var str1 = "A"
var str2 = "B"

print("交换前数据: \(str1) and \(str2)")
swapTwoValues(&str1, &str2)
print("交换后数据: \(str1) and \(str2)")

protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int{get}
    subscript(i: Int)->ItemType{get}
}

struct Stack<T>: Container {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop()->T {
        return items.removeLast()
    }
    
    //Container Protocol
    mutating func append(_ item: T) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> T {
        return items[i]
    }
}

extension Array: Container{}

func allItemsMatch<c1: Container, c2: Container>(_ someContainer: c1, _ anotherContainer: c2) -> Bool where c1.ItemType == c2.ItemType, c2.ItemType: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stackOfStrings = Stack<String>()
print("In")
stackOfStrings.push("google")
stackOfStrings.push("runoob")
print(stackOfStrings.items)

let deletetos = stackOfStrings.pop()
print("Out:"+deletetos)

var stackOfInts = Stack<Int>()
print("In")
stackOfInts.push(1)
stackOfInts.push(2)
print(stackOfInts.items)

extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil: items[items.count-1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("Top is: \(topItem)")
}

