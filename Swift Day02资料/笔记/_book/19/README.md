# 三大特性
### 继承
* 如果我们要定义一个class表示一个人
* 它有两个属性表示name和age：

```swift
class Person {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
```

* 接下来，如果我们还需要一个类表示一个学生呢？
* 最想当然的做法当然是如法炮制一个类似的class

```swift
class Student {
    var name : String
    var age : Int
    var ID : String

    init(name : String, age : Int, ID : String) {
        self.name = name
        self.age = age
        self.ID = ID
    }
}
```

* 在Person和Student里，有很多内容都是重复的
    * 它们的某些属性是重复的
    * 它们的init方法有部分代码也是重复的
    * An Student IS A Person
* 正确写法应该是使用继承

```swift
class Student: Person {
    var ID : String

    init(name : String, age : Int, ID : String) {
        self.ID = ID
        super.init(name: name, age: age)
    }
}
```

### 重载
* 在类中我们可以定义很多行为,比如在Person添加读书的行为
    * 我们会发现子类是可以继承父类的方法的
    * 但是如果子类对父类的行为不满意,可以对父类方法进行重写
        * 在swift中如果对父类的方法进行重写必须在func前加override

```swift
// Person中的方法
func readBook() {
    print("在读书")
}

// Student中的方法
override func readBook() {
    print("学生在学习")
}
```

### 多态
* 多态有三大条件
    * 必须有继承
    * 必须有重写
    * 必须是父类指针指向子类对象

```swift
// 定义教师类
class Teacher : Person {
    override func readBook() {
        print("老师在备课")
    }
}

// 定义测试方法
func test(person : Person) {
    person.readBook()
}

// 创建对象
let p = Person(name: "yz", age: 20)
let stu = Student(name: "lmj", age: 19, ID: "110")
let tea = Teacher(name: "why", age: 18)

// 测试
test(p)
test(stu)
test(tea)
```



