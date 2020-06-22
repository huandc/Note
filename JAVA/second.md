# Objuct 类  

`java.lang.Object`类是Java语言中的根类，即所有类的父类。它中描述的所有方法子类都可以使用。在对象实例化的时候，最终找的父类就是Object。  
如果一个类没有特别指定父类，  那么默认则继承自Object类。例如：

```java
public class MyClass /*extends Object*/ {
    // ...
}
```

看一个类是否重写了toString方法,直接打印类对象对象名字即可,如果没有重写toString方法那么打印的是对象的地址值.  
创建一个自己的类 重写tostringc方法.  

## 1.3 equals方法

### 方法摘要

* `public boolean equals(Object obj)`：指示其他某个对象是否与此对象“相等”。(引用类型比较比较的是地址值)

调用成员方法equals并指定参数为另一个对象，则可以判断这两个对象是否是相同的。这里的“相同”有默认和自定义两种方式。

### 默认地址比较

如果没有覆盖重写equals方法，那么Object类中默认进行`==`运算符的对象地址比较，只要不是同一个对象，结果必然为false。

### 对象内容比较

如果希望进行对象的内容比较，即所有或指定的部分成员变量相同就判定两个对象相同，则可以覆盖重写equals方法。例如：

```java
import java.util.Objects;

public class Person {
    private String name;
    private int age;
    @Override
    public boolean equals(Object o) {
        // 如果对象地址一样，则认为相同
        if (this == o)
            return true;
        // 如果参数为空，或者类型信息不一样，则认为不同
        if (o == null || getClass() != o.getClass())
            return false;
        // 转换为当前类型
        if(o instanceof Person){
            Person person = (Person) o;
        // 要求基本类型相等，并且将引用类型交给java.util.Objects类的equals静态方法取用结果
        return age == person.age && Objects.equals(name, person.name);
        }
       return false;
    }
}
```

# 第二章 日期时间类  

## 2.1 Date类  

` java.util.Date`类 表示特定的瞬间，精确到毫秒。  
- `public Date()`：分配Date对象并初始化此对象，以表示分配它的时间（精确到毫秒）。  

- `public Date(long date)`：分配Date对象并初始化此对象，以表示自从标准基准时间（称为“历元（epoch）”，即1970年1月1日00:00:00 GMT）以来的指定毫秒数。  

```java
public static void main(String[] args) {
    Date date = new Date();
    //空参 当前系统日期时间
    System.out.println(date);
    //将毫秒值转化为Date日期
    System.out.println(new Date(100L));
    //把日期转化为毫秒
    System.out.println(new Date().getTime());
}
```

## 2.2 DateFormat类

`java.text.DateFormat` 是日期/时间格式化子类的抽象类，我们通过这个类可以帮我们完成日期和文本之间的转换,也就是可以在Date对象与String对象之间进行来回转换。  

* **格式化**：按照指定的格式，从Date对象转换为String对象。  
* **解析**：按照指定的格式，从String对象转换为Date对象。  
由于DateFormat为抽象类，不能直接使用，所以需要常用的子类`java.text.    SimpleDateFormat`。这个类需要一个模式（格式）来指定格式化或解析的标准。构造方法为：  
`String format(Date date)` 按照指定模式将Date日期,格式化为符合模式的字符串.  
`Date parse(String source)` 把符合模式的字符串,解析为Date日期.  
`public SimpleDateFormat(String pattern)`用给定的模式和默认语言环境的日期格式符号构造 SimpleDateFormat。  
参数**pattern** 指定模式:  
| 标识字母（区分大小写） | 含义   |
| ----------- | ---- |
| y           | 年    |
| M           | 月    |
| d           | 日    |
| H           | 时    |
| m           | 分    |
| s           | 秒    |