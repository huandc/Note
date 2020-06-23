# Object 类  

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
* `public Date()`：分配Date对象并初始化此对象，以表示分配它的时间（精确到毫秒）。  

* `public Date(long date)`：分配Date对象并初始化此对象，以表示自从标准基准时间（称为“历元（epoch）”，即1970年1月1日00:00:00 GMT）以来的指定毫秒数。  

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
由于DateFormat为抽象类，不能直接使用，所以需要常用的子类`java.text.    SimpleDateFormat`。(将Date和字符串转化)这个类需要一个模式（格式）来指定格式化或解析的标准。构造方法为：  
`String format(Date date)` 按照指定模式将Date日期,格式化为符合模式的字符串.  
`Date parse(String source)` 把符合模式的字符串,解析为Date日期.  
`public SimpleDateFormat(String pattern)`用给定的模式和默认语言环境的日期格式符号构造 SimpleDateFormat。  
参数**pattern** 指定模式: 

| 标识字母（区分大小写） | 含义  |
| ----------* | ---* |
| y           | 年    |
| M           | 月    |
| d           | 日    |
| H           | 时    |
| m           | 分    |
| s           | 秒    |
写对应的模式,会将模式替换为对应的日期和时间.  

```java
package cn.handc.day12.demo02;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Demo03DateFormat {
    public static void main(String[] args) throws ParseException {
        //SimpleDateFormat pattern对应格式YYYY.MM.DD-HH.MM.ss
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY.MM.DD-HH.MM.ss");
        Date date = new Date();
        //将date格式化为符合模式的字符串
        String str = dateFormat.format(date);
        System.out.println(date);
        System.out.println(str);

        Date date2 = dateFormat.parse("1988.01.01-12.33.21");
        System.out.println(date2);
    }
}
```

## 2.4 Calendar类

###  概念

`java.util.Calendar`是日历类，在Date后出现，替换掉了许多Date的方法。该类将所有可能用到的时间信息封装为静态成员变量，方便获取。日历类就是方便获取各个时间属性的。  

Calendar 类是一个抽象类，它为特定瞬间与一组诸如 YEAR、MONTH、DAY_OF_MONTH、HOUR 等.  
Calender类无法直接使用,里面有一个静态方法getInstance返回子类对象.  
`public static Calendar getInstance()`



### 常用方法

根据Calendar类的API文档，常用方法有：

* `public int get(int field)`：返回给定日历字段的值。
* `public void set(int field, int value)`：将给定的日历字段设置为给定值。
* `public abstract void add(int field, int amount)`：根据日历的规则，为给定的日历字段添加或减去指定的时间量。
* `public Date getTime()`：返回一个表示此Calendar时间值（从历元到现在的毫秒偏移量）的Date对象。

Calendar类中提供很多成员常量，代表给定的日历字段：

| 字段值          | 含义                   |
| -----------* | -------------------* |
| YEAR         | 年                    |
| MONTH        | 月（从0开始，可以+1使用）       |
| DAY_OF_MONTH | 月中的天（几号）             |
| HOUR         | 时（12小时制）             |
| HOUR_OF_DAY  | 时（24小时制）             |
| MINUTE       | 分                    |
| SECOND       | 秒                    |
| DAY_OF_WEEK  | 周中的天（周几，周日为1，可以-1使用） |

```java
public class Demo01Calendar {
    public static void main(String[] args) {
        // 创建Calendar对象
        Calendar cal = Calendar.getInstance();
        // 设置年
        int year = cal.get(Calendar.YEAR);
        // 设置月
        int month = cal.get(Calendar.MONTH) + 1;
        // 设置日
        int dayOfMonth = cal.get(Calendar.DAY_OF_MONTH);
        System.out.println(year + "年" + month + "月" + dayOfMonth + "日");
        System.out.println(cal.getTime());
    }
}
```

```java
public class Demo07CalendarMethod {
    public static void main(String[] args) {
        Calendar cal = Calendar.getInstance();
        //YEAR字段设置为2000
        cal.set(Calendar.YEAR, 20);
        System.out.print(year + "年" + month + "月" + dayOfMonth + "日"); // 2020年1月17日
    }
}
```

> 小贴士：
>
> ​     西方星期的开始为周日，中国为周一。
>
> ​     在Calendar类中，月份的表示是以0-11代表1-12月。
>
> ​     日期是有大小关系的，时间靠后，时间越大。

# 第三章 System类

`java.lang.System`类中提供了大量的静态方法，可以获取与系统相关的信息或系统级操作，在System类的API文档中，常用的方法有：  

* `public static long currentTimeMillis()`：返回以毫秒为单位的当前时间。  
* `public static void arraycopy(Object src, int srcPos, Object dest, int destPos, int length)`：将数组中指定的数据拷贝到另一个数组中。  

## 3.1 currentTimeMillis方法

实际上，currentTimeMillis方法就是 获取当前系统时间与1970年01月01日00:00点之间的毫秒差值.  

```java
import java.util.Date;

public class SystemDemo {
    public static void main(String[] args) {
        //获取当前毫秒值
        long timeMillis = System.currentTimeMillis();
        System.out.println(timeMillis);//1592879141505
    }
}
```

## 3.2 arraycopy方法

* `public static void arraycopy(Object src, int srcPos, Object dest, int destPos, int length)`：将数组中指定的数据拷贝到另一个数组中。

数组的拷贝动作是系统级的，性能很高。System.arraycopy方法具有5个参数，含义分别为：

| 参数序号 | 参数名称    | 参数类型   | 参数含义       |
| ---* | ------* | -----* | ---------* |
| 1    | src     | Object | 源数组        |
| 2    | srcPos  | int    | 源数组索引起始位置  |
| 3    | dest    | Object | 目标数组       |
| 4    | destPos | int    | 目标数组索引起始位置 |
| 5    | length  | int    | 复制元素个数     |

# 第四章 StringBuilder类

## 4.1 字符串拼接问题

由于String类的对象内容不可改变，所以每当进行字符串拼接时，总是会在内存中创建一个新的对象。例如：  

```java
public class StringDemo {
    public static void main(String[] args) {
        String s = "Hello";
        s += "World";
        System.out.println(s);
    }
}
```

在API中对String类有这样的描述：字符串是常量，它们的值在创建后不能被更改。  

根据这句话分析我们的代码，其实总共产生了三个字符串，即`"Hello"`、`"World"`和`"HelloWorld"`。引用变量s首先指向`Hello`对象，最终指向拼接出来的新字符串对象，即`HelloWord` 。  

由此可知，如果对字符串进行拼接操作，每次拼接，都会构建一个新的String对象，既耗时，又浪费空间。为了解决这一问题，可以使用`java.lang.StringBuilder`类。  

## 4.2 StringBuilder概述

查阅`java.lang.StringBuilder`的API，StringBuilder又称为可变字符序列，它是一个类似于 String 的字符串缓冲区，通过某些方法调用可以改变该序列的长度和内容。

原来StringBuilder是个字符串的缓冲区，即它是一个容器，容器中可以装很多字符串。并且能够对其中的字符串进行各种操作。

它的内部拥有一个数组用来存放字符串内容，进行字符串拼接时，直接在数组中加入新内容。StringBuilder会自动维护数组的扩容。原理如下图所示：(默认16字符空间，超过自动扩充)  

## 4.3 构造方法

根据StringBuilder的API文档，常用构造方法有2个：

* `public StringBuilder()`：构造一个空的StringBuilder容器。
* `public StringBuilder(String str)`：构造一个StringBuilder容器，并将字符串添加进去。

```java
public class StringBuilderDemo {
    public static void main(String[] args) {
        //无参构造
        StringBuilder sb1 = new StringBuilder();
        System.out.println(sb1);//
        //有参构造
        StringBuilder sb2 = new StringBuilder("你好");
        System.out.println(sb2);//你好

    }
}
```

## 4.4 常用方法

StringBuilder常用的方法有2个：

* `public StringBuilder append(...)`：添加任意类型数据的字符串形式，并返回当前对象自身。
* `public String toString()`：将当前StringBuilder对象转换为String对象。

```java
public class Demo01 {
    public static void main(String[] args) {
        //创建对象
        StringBuilder builder = new StringBuilder();
        //public StringBuilder append(任意类型)
        //返回自身
        StringBuilder builder2 = builder.append("hello");
        //对比一下
        System.out.println("builder:" + builder);//builder:hello
        System.out.println("builder2:" + builder2);//builder2:hello
        System.out.println(builder == builder2); //true
        // 可以添加 任何类型
        builder.append("hello");
        builder.append("world");
        builder.append(true);
        builder.append(100);
        // 在我们开发中，会遇到调用一个方法后，返回一个对象的情况。然后使用返回的对象继续调用方法。
        // 这种时候，我们就可以把代码现在一起，如append方法一样，代码如下
        //链式编程
        builder.append("hello").append("world").append(true).append(100);
        System.out.println("builder:" + builder);
    }
}
```

### toString方法

通过toString方法，StringBuilder对象将会转换为不可变的String对象。如：

```java
public class Demo16StringBuilder {
    public static void main(String[] args) {
        // 链式创建
        StringBuilder sb = new StringBuilder("Hello").append("World").append("Java");
        // 调用方法
        String str = sb.toString();
        System.out.println(str); // HelloWorldJava
    }
}
```

# 第五章 包装类

## 5.1 概述

Java提供了两个类型系统，基本类型与引用类型，使用基本类型在于效率，然而很多情况，会创建对象使用，因为对象可以做更多的功能，如果想要我们的基本类型像对象一样操作，就可以使用基本类型对应的包装类，如下：

| 基本类型    | 对应的包装类（位于java.lang包中） |
| ------* | --------------------* |
| byte    | Byte                  |
| short   | Short                 |
| int     | **Integer**           |
| long    | Long                  |
| float   | Float                 |
| double  | Double                |
| char    | **Character**         |
| boolean | Boolean               |

## 5.2 装箱与拆箱

基本类型与对应的包装类对象之间，来回转换的过程称为”装箱“与”拆箱“：

* **装箱**：从基本类型转换为对应的包装类对象。

* **拆箱**：从包装类对象转换为对应的基本类型。

用Integer与 int为例：（看懂代码即可）

装箱 基本数值---->包装对象

```java
Integer i = new Integer(4);//使用构造函数函数
Integer iii = Integer.valueOf(4);//使用包装类中的valueOf方法
```

拆箱 包装对象---->基本数值

```java
int num = i.intValue();
```

## 5.3自动装箱与自动拆箱

由于我们经常要做基本类型与包装类之间的转换，从Java 5（JDK 1.5）开始，基本类型与包装类的装箱、拆箱动作可以自动完成。例如：

```java
Integer i = 4;//自动装箱。相当于Integer i = Integer.valueOf(4);
i = i + 5;//等号右边：将i对象转成基本数值(自动拆箱) i.intValue() + 5;
//加法运算完成后，再次装箱，把基本数值转成对象。
```

## 5.3 基本类型与字符串之间的转换

### 基本类型转换为String

   基本类型转换String总共有三种方式，查看课后资料可以得知，这里只讲最简单的一种方式： 

```
基本类型直接与””相连接即可；如：34+""
```

String转换成对应的基本类型.  

除了Character类之外，其他所有包装类都具有parseXxx静态方法可以将字符串参数转换为对应的基本类型：

* `public static byte parseByte(String s)`：将字符串参数转换为对应的byte基本类型。
* `public static short parseShort(String s)`：将字符串参数转换为对应的short基本类型。
* `public static int parseInt(String s)`：将字符串参数转换为对应的int基本类型。
* `public static long parseLong(String s)`：将字符串参数转换为对应的long基本类型。
* `public static float parseFloat(String s)`：将字符串参数转换为对应的float基本类型。
* `public static double parseDouble(String s)`：将字符串参数转换为对应的double基本类型。
* `public static boolean parseBoolean(String s)`：将字符串参数转换为对应的boolean基本类型。

代码使用（仅以Integer类的静态方法parseXxx为例）如：

```java
public class Demo18WrapperParse {
    public static void main(String[] args) {
        int num = Integer.parseInt("100");
    }
}
```

> 注意:如果字符串参数的内容无法正确转换为对应的基本类型，则会抛出`java.lang.NumberFormatException`异常。

# 第六章 Collection集合

## 1.1 集合概述

在前面基础班我们已经学习过并使用过集合`ArrayList<E>` ,那么集合到底是什么呢?

* **集合**：集合是java中提供的一种容器，可以用来存储多个数据。

集合和数组既然都是容器，它们有啥区别呢？

* 数组的长度是固定的。集合的长度是可变的。
```int arr[] = new int[10];```  
* 数组中存储的是同一类型的元素，可以存储基本数据类型值。**集合存储的都是对象**。而且对象的类型可以不一致。在开发中一般当对象多的时候，使用集合进行存储。

## 1.2  集合框架

JAVASE提供了满足各种需求的API，在使用这些API前，先了解其继承与接口操作架构，才能了解何时采用哪个类，以及类之间如何彼此合作，从而达到灵活应用。

集合按照其存储结构可以分为两大类，分别是单列集合`java.util.Collection`和双列集合`java.util.Map`，今天我们主要学习`Collection`集合，在day04时讲解`Map`集合。

* **Collection**：单列集合类的根接口，用于存储一系列符合某种规则的元素，它有两个重要的子接口，分别是`java.util.List`和`java.util.Set`。其中，`List`的特点是元素有序、元素可重复。`Set`的特点是元素无序，而且不可重复。`List`接口的主要实现类有`java.util.ArrayList`和`java.util.LinkedList`，`Set`接口的主要实现类有`java.util.HashSet`和`java.util.TreeSet`。

* List接口:  
(Vector集合, ArrayList集合, LinkedList集合)  

1. 有序的集合  
2. 允许存储重复的元素  
3. 有索引,可以使用普通发for循环遍历  

* Set接口:  
(TreeSet集合, HashSet集合, LinkedHashSet集合)  

1. 不允许存储重复的元素  
2. 没有索引,不能使用普通发for循环遍历  

从上面的描述可以看出JDK中提供了丰富的集合类库，为了便于初学者进行系统地学习，接下来通过一张图来描述整个集合类的继承体系。

其中，橙色框里填写的都是接口类型，而蓝色框里填写的都是具体的实现类。这几天将针对图中所列举的集合类进行逐一地讲解。

集合本身是一个工具，它存放在java.util包中。在`Collection`接口定义着单列集合框架中最最共性的内容。

## 1.3 Collection 常用功能

Collection是所有单列集合的父接口，因此在Collection中定义了单列集合(List和Set)通用的一些方法，这些方法可用于操作所有的单列集合。方法如下：

* `public boolean add(E e)`：  把给定的对象添加到当前集合中 。
* `public void clear()` :清空集合中所有的元素。
* `public boolean remove(E e)`: 把给定的对象在当前集合中删除。
* `public boolean contains(E e)`: 判断当前集合中是否包含给定的对象。
* `public boolean isEmpty()`: 判断当前集合是否为空。
* `public int size()`: 返回集合中元素的个数。
* `public Object[] toArray()`: 把集合中的元素，存储到数组中。

方法演示：

```java
public class Demo1Collection {
    public static void main(String[] args) {
        // 创建集合对象
        // 使用多态形式
        Collection<String> coll = new ArrayList<String>();
        // 使用方法
        // 添加功能  boolean  add(String s)
        coll.add("小李广");
        coll.add("扫地僧");
        coll.add("石破天");
        System.out.println(coll);//[小李广, 扫地僧, 石破天]

        // boolean contains(E e) 判断o是否在集合中存在
        System.out.println("判断  扫地僧 是否在集合中" + coll.contains("扫地僧"));//判断  扫地僧 是否在集合中true

        //boolean remove(E e) 删除在集合中的o元素
        System.out.println("删除石破天：" + coll.remove("石破天"));//删除石破天：true
        System.out.println("操作之后集合中元素:" + coll);//操作之后集合中元素:[小李广, 扫地僧]

        // size() 集合中有几个元素
        System.out.println("集合中有" + coll.size() + "个元素");//集合中有2个元素

        // Object[] toArray()转换成一个Object数组
        Object[] objects = coll.toArray();
        // 遍历数组
        for (int i = 0; i < objects.length; i++) {
            System.out.println(objects[i]);
        }
        // void  clear() 清空集合
        coll.clear();
        System.out.println("集合中内容为：" + coll);//[]
        // boolean  isEmpty()  判断是否为空
        System.out.println(coll.isEmpty());//true
    }
}
```

> tips: 有关Collection中的方法可不止上面这些，其他方法可以自行查看API学习。


# 第七章 Iterator迭代器

## 2.1 Iterator接口

在程序开发中，经常需要遍历集合中的所有元素。针对这种需求，JDK专门提供了一个接口`java.util.Iterator`。`Iterator`接口也是Java集合中的一员，但它与`Collection`、`Map`接口有所不同，`Collection`接口与`Map`接口主要用于存储元素，而`Iterator`主要用于迭代访问（即遍历）`Collection`中的元素，因此`Iterator`对象也被称为迭代器。

想要遍历Collection集合，那么就要获取该集合迭代器完成迭代操作，下面介绍一下获取迭代器的方法：

* `public Iterator iterator()`: 获取集合对应的迭代器，用来遍历集合中的元素的。

下面介绍一下迭代的概念：

* **迭代**：即Collection集合元素的通用获取方式。在取元素之前先要判断集合中有没有元素，如果有，就把这个元素取出来，继续在判断，如果还有就再取出出来。一直把集合中的所有元素全部取出。这种取出方式专业术语称为迭代。

Iterator接口的常用方法如下：  
需要使用Iterator的实现类,  Collection接口中,有一个`iterator()`方法,该放方法赶回的就是需要使用Iterator的实现类对象.  

* `public E next()`:返回迭代的下一个元素。
* `public boolean hasNext()`:如果仍有元素可以迭代，则返回 true。

接下来我们通过案例学习如何使用Iterator迭代集合中元素：

```java
public class IteratorDemo {
    public static void main(String[] args) {
        // 使用多态方式 创建对象
        Collection<String> coll = new ArrayList<String>();

        // 添加元素到集合
        coll.add("串串星人");
        coll.add("吐槽星人");
        coll.add("汪星人");
        //遍历
        //使用迭代器 遍历   每个集合对象都有自己的迭代器
        Iterator<String> it = coll.iterator();
        //  泛型指的是 迭代出 元素的数据类型
        while(it.hasNext()){ //判断是否有迭代元素
            String s = it.next();//获取迭代出的元素
            System.out.println(s);
        }
    }
}
```

> tips:：在进行集合元素取出时，如果集合中已经没有元素了，还继续使用迭代器的next方法，将会发生java.util.NoSuchElementException没有集合元素的错误。

## 2.2 迭代器的实现原理

我们在之前案例已经完成了Iterator遍历集合的整个过程。当遍历集合时，首先通过调用t集合的iterator()方法获得迭代器对象，然后使用hashNext()方法判断集合中是否存在下一个元素，如果存在，则调用next()方法将元素取出，否则说明已到达了集合末尾，停止遍历元素。

Iterator迭代器对象在遍历集合时，内部采用指针的方式来跟踪集合中的元素，为了让初学者能更好地理解迭代器的工作原理，接下来通过一个图例来演示Iterator对象迭代元素的过程：

在调用Iterator的next方法之前，迭代器的索引位于第一个元素之前，不指向任何元素，当第一次调用迭代器的next方法后，迭代器的索引会向后移动一位，指向第一个元素并将该元素返回，当再次调用next方法时，迭代器的索引会指向第二个元素并将该元素返回，依此类推，直到hasNext方法返回false，表示到达了集合的末尾，终止对元素的遍历。

## 2.3 增强for

增强for循环(也称for each循环)是**JDK1.5**以后出来的一个高级for循环，专门用来遍历数组和集合的。它的内部原理其实是个Iterator迭代器，所以在遍历的过程中，不能对集合中的元素进行增删操作。

格式：

```java
for(元素的数据类型  变量 : Collection集合or数组){ 
  	//写操作代码
}
```

它用于遍历Collection和数组。通常只进行遍历元素，不要在遍历的过程中对集合元素进行增删操作。

#### 练习1：遍历数组

```java
public class NBForDemo1 {
        public static void main(String[] args) {
        int[] arr = {3,5,6,87};
        //使用增强for遍历数组
        for(int a : arr){//a代表数组中的每个元素
            System.out.println(a);
        }
    }
}
```

#### 练习2:遍历集合

```java
public class NBFor {
    public static void main(String[] args) {
        Collection<String> coll = new ArrayList<String>();
        coll.add("小河神");
        coll.add("老河神");
        coll.add("神婆");
        //使用增强for遍历
        for(String s :coll){//接收变量s代表 代表被遍历到的集合元素
            System.out.println(s);
        }
    }
}
```

> tips: 新for循环必须有被遍历的目标。目标只能是Collection或者是数组。新式for仅仅作为遍历操作出现。

# 第八章 泛型

## 泛型概述

在前面学习集合时，我们都知道集合中是可以存放任意对象的，只要把对象存储集合后，那么这时他们都会被提升成Object类型。当我们在取出每一个对象，并且进行相应的操作，这时必须采用类型转换。  

泛型:是一种未知的数据类型,当我们不知道使用什么数据类型的时候,可以使用泛型.  
泛型也可以看成是一个变量用来接收数据类型.  
ArratList集合在定义时候,不知道集合中都会存储那些类型,定义为泛型.  

```java
public class ArrayList<E>{
    //创建集合对象时,就会确定泛型的类型
    public boolean add(E e);
    public E get(int index);
}
```

下面代码：

```java
public class GenericDemo {
    public static void main(String[] args) {
        Collection coll = new ArrayList();
        coll.add("abc");
        coll.add("itcast");
        coll.add(5);//由于集合没有做任何限定，任何类型都可以给其中存放
        Iterator it = coll.iterator();
        while(it.hasNext()){
            //需要打印每个字符串的长度,就要把迭代出来的对象转成String类型
            String str = (String) it.next();
            System.out.println(str.length());
        }
    }
}
```

程序在运行时发生了问题**java.lang.ClassCastException**。为什么会发生类型转换异常呢？我们来分析下：由于集合中什么类型的元素都可以存储。导致取出时强转引发运行时 ClassCastException。怎么来解决这个问题呢？Collection虽然可以存储各种对象，但实际上通常Collection只存储同一类型对象。例如都是存储字符串对象。因此在JDK5之后，新增了**泛型**(**Generic**)语法，让你在设计API时可以指定类或方法支持泛型，这样我们使用API的时候也变得更为简洁，并得到了编译时期的语法检查。

* **泛型**：可以在类或方法中预支地使用未知的类型。

> tips:一般在创建对象时，将未知的类型确定具体的类型。当没有指定泛型时，默认类型为Object类型。

## 使用泛型的好处

上一节只是讲解了泛型的引入，那么泛型带来了哪些好处呢？

* 将运行时期的ClassCastException，转移到了编译时期变成了编译失败。
* 避免了类型强转的麻烦。

通过我们如下代码体验一下：

```java
public class GenericDemo2 {
    public static void main(String[] args) {
        Collection<String> list = new ArrayList<String>();
        list.add("abc");
        list.add("itcast");
        // list.add(5);//当集合明确类型后，存放类型不一致就会编译报错
        // 集合已经明确具体存放的元素类型，那么在使用迭代器的时候，迭代器也同样会知道具体遍历元素类型
        Iterator<String> it = list.iterator();
        while(it.hasNext()){
            String str = it.next();
            //当使用Iterator<String>控制元素类型后，就不需要强转了。获取到的元素直接就是String类型
            System.out.println(str.length());
        }
    }
}
```

> tips:泛型是数据类型的一部分，我们将类名与泛型合并一起看做数据类型。

## 泛型的定义与使用

我们在集合中会大量使用到泛型，这里来完整地学习泛型知识。

泛型，用来灵活地将数据类型应用到不同的类、方法、接口当中。将数据类型作为参数进行传递。

泛型的类:  

```java
修饰符 class 类名<代表泛型的变量> {  }
```

**在创建对象的时候确定泛型**  
 例如，`ArrayList<String> list = new ArrayList<String>();`

此时，变量E的值就是String类型,那么我们的类型就可以理解为：

```java
class ArrayList<String>{
     public boolean add(String e){ }

     public String get(int index){  }
     ...
}
```

再例如，`ArrayList<Integer> list = new ArrayList<Integer>();`

此时，变量E的值就是Integer类型,那么我们的类型就可以理解为：

```java
class ArrayList<Integer> {
     public boolean add(Integer e) { }

     public Integer get(int index) {  }
     ...
}
```

* 定义一个泛型类  

```java
public class Generic<E> {
    private E name;

    public E getName() {
        return name;
    }

    public void setName(E name) {
        this.name = name;
    }
}
```

* 测试类:  

```java
public static void main(String[] args) {
    //String类型
    Generic<String> gc = new Generic<>();
    gc.setName("只能是字符串");
    System.out.println(gc.getName());

    //Integer类型
    Generic<Integer> gc2 = new Generic();
    gc2.setName(10);
    System.out.println(gc2.getName());
}
```

### 含有泛型的方法  

定义格式：  

```java
修饰符 <代表泛型的变量> 返回值类型 方法名(参数){  
    //...
}
```

* 定义一个泛型方法  

```java
public class GenericMethod<E> {
    //定义一个泛型方法
    public <E> void method01(E e){
        System.out.println("泛型方法01输出 :"+e);
    }
    public static <E>void  method02(E e){

        System.out.println("泛型静态方法02输出 :"+e);
    }
}
```

使用格式：**调用方法时，确定泛型的类型**
  
* 使用泛型方法  

```java
public class Demo01GenericMethod {
    public static void main(String[] args) {
        GenericMethod gm = new GenericMethod();
        gm.method01("Hello");//泛型方法01输出 :Hello
        gm.method01(8.8);//泛型方法01输出 :8.8
        gm.method01(true);//泛型方法01输出 :true

        gm.method02("静态方法不建议创建对象使用");//泛型静态方法02输出 :静态方法不建议创建对象使用
        new GenericMethod().method02("静态方法不创建对象");//泛型静态方法02输出 :静态方法不创建对象
    }
}
```

### 含有泛型的接口

定义格式：

```java
修饰符 interface接口名<代表泛型的变量> {  }
```

* 定义含有泛型的接口  

```java
public interface GenericINterface<E> {
    //定义含有泛型的接口
    public abstract void method(E e);
}
```

* **1、定义类时确定泛型的类型**(实现接口的实现类同时指定泛型String)

```java
public class GenericINterfaceImpl01 implements GenericINterface<String> {
    //含有泛型的接口的第一种使用方法:定义接口的实现类,实现接口,指定接口的泛型String
    @Override
    public void method(String s) {
        System.out.println("实现接口的实现类同时指定泛型String : "+s);
    }
}
```

* **2、始终不确定泛型的类型，直到创建对象时，确定泛型的类型**(实现接口的实现类并且不指定泛型)类跟随着接口泛型走

```java
public class GenericINterfaceImpl02<E> implements GenericINterface<E> {
    //含有泛型的接口的第二种使用方法:定义接口的实现类,实现接口,指不定接口的泛型
    @Override
    public void method(E e) {
        System.out.println("实现接口的实现类不指定泛型 : "+e);
    }
}
```

* 测试

```java
public static void main(String[] args) {

    GenericINterfaceImpl01 gil = new GenericINterfaceImpl01();
    gil.method("调用指定String");

    // /创建对象时，确定泛型的类型
    GenericINterfaceImpl02 gil = new GenericINterfaceImpl02<String>();
    gil.method("调用没指定");
}
```

## 泛型通配符

当使用泛型类或者接口时，传递的数据中，泛型类型不确定，可以通过通配符<?>表示。但是一旦使用泛型的通配符后，只能使用Object类中的共性方法，集合中元素自身方法无法使用。

### 通配符基本使用

泛型的通配符:**不知道使用什么类型来接收的时候,此时可以使用?,?表示未知通配符。**

此时只能接受数据,不能往该集合中存储数据。

```java
public class Demo01 {
    /*
    * 泛型通配符: ?
    * 不能创建对象使用 只能作为方法的参数使用.
    * */
    public static void main(String[] args) {
        ArrayList<Integer> list1 = new ArrayList<>();
        list1.add(1);
        list1.add(2);
        ArrayList<String> list2 = new ArrayList<>();
        list2.add("a");
        list2.add("b");

        printArray(list1);//遍历Integer类型的ArrayList
        printArray(list2);//遍历String类型的ArrayList
    }
    /*
     * 定义一个方法,能遍历所有类型的Arraylist集合
     * */
    private static void printArray(ArrayList<?> list) {
        Iterator it = list.iterator();
        while ( it.hasNext()) {
            System.out.println(it.next());
        }
    }
}
```

### 通配符高级使用----受限泛型

之前设置泛型的时候，实际上是可以任意设置的，只要是类就可以设置。但是在JAVA的泛型中可以指定一个泛型的**上限**和**下限**。

**泛型的上限**：

* **格式**： `类型名称 <? extends 类 > 对象名称`
* **意义**： `只能接收该类型及其子类`

**泛型的下限**：

* **格式**： `类型名称 <? super 类 > 对象名称`
* **意义**： `只能接收该类型及其父类型`

比如：现已知Object类，String 类，Number类，Integer类，其中Number是Integer的父类

```java
public static void main(String[] args) {
    Collection<Integer> list1 = new ArrayList<Integer>();
    Collection<String> list2 = new ArrayList<String>();
    Collection<Number> list3 = new ArrayList<Number>();
    Collection<Object> list4 = new ArrayList<Object>();

    getElement(list1);
    getElement(list2);//报错  String不是Number的子类或本身
    getElement(list3);
    getElement(list4);//报错  Object不是Number的子类或本身
  
    getElement2(list1);//报错 Integer是Number的父类,是其子类
    getElement2(list2);//报错 String不是Number的父类
    getElement2(list3);
    getElement2(list4);
  
}
// 泛型的上限：此时的泛型?，必须是Number类型或者Number类型的子类
public static void getElement1(Collection<? extends Number> coll){}

// 泛型的下限：此时的泛型?，必须是Number类型或者Number类型的父类
public static void getElement2(Collection<? super Number> coll){}
```

