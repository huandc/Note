# 第一章 Stream流

说到Stream便容易想到I/O Stream，而实际上，谁规定“流”就一定是“IO流”呢？在Java 8中，得益于Lambda所带
来的函数式编程，引入了一个全新的Stream概念，用于解决已有集合类库既有的弊端。

## 1.1 引言

## 传统集合的多步遍历代码

几乎所有的集合（如Collection接口或Map接口等）都支持直接或间接的遍历操作。而当我们需要对集合中的元
素进行操作的时候，除了必需的添加、删除、获取外，最典型的就是集合遍历。例如：

```java
public class Demo01 {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("张三");
        list.add("李四");
        list.add("王五");
        list.add("赵六");
        list.add("田七");
        for (String s : list) {
            System.out.println(s);
        }
    }
}
```

这是一段非常简单的集合遍历操作：对集合中的每一个字符串都进行打印输出操作。

### 循环遍历的弊端

Java 8的Lambda让我们可以更加专注于做什么（What），而不是怎么做（How），这点此前已经结合内部类进行
了对比说明。现在，我们仔细体会一下上例代码，可以发现：

- for循环的语法就是“怎么做”
- for循环的循环体才是“做什么”

为什么使用循环？因为要进行遍历。但循环是遍历的唯一方式吗？遍历是指每一个元素逐一进行处理，而并不是从
第一个到最后一个顺次处理的循环。前者是目的，后者是方式。

试想一下，如果希望对集合中的元素进行筛选过滤：

1. 将集合A根据条件一过滤为子集B；
2. 然后再根据条件二过滤为子集C。

那怎么办？在Java 8之前的做法可能为：

```java
public class Demo01 {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("张三");
        list.add("李四");
        list.add("王五");
        list.add("赵六");
        list.add("田七");

        //对list集合中元素进行过滤,张开头的元素存储到新的集合
        List<String> zhang_List = new ArrayList<>();
        for (String s : list) {
            if (s.startsWith("张")) {
                zhang_List.add(s);
            }
        }

        //姓名长度为2的人
        List<String> short_List = new ArrayList<>();
        for (String s : zhang_List) {
            if (s.length() == 2) {
                short_List.add(s);
            }
        }

        for (String s : short_List) {
            System.out.println(s);
        }
    }
}
```

#### 这段代码中含有三个循环，每一个作用不同：

- 1. 首先筛选所有姓张的人；

- 2. 然后筛选名字有三个字的人；

- 3. 最后进行对结果进行打印输出。

> 每当我们需要对集合中的元素进行操作的时候，总是需要进行循环、循环、再循环。这是理所当然的么？不是。循环是做事情的方式，而不是目的。另一方面，使用线性循环就意味着只能遍历一次。如果希望再次遍历，只能再使用另一个循环从头开始。那，Lambda的衍生物Stream能给我们带来怎样更加优雅的写法呢？

### Stream的更优写法

下面来看一下借助Java 8的Stream API，什么才叫优雅：

```java
public class Demo02 {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("张三");
        list.add("李四");
        list.add("王五");
        list.add("赵六");
        list.add("田七");

        //对list集合中元素进行过滤,张开头的元素存储到新的集合
        //姓名长度为2的人
        list.stream()
                .filter(name -> name.startsWith("张"))
                .filter(name -> name.length() == 2)
                .forEach(name -> System.out.println(name));
    }
}
```

> 直接阅读代码的字面意思即可完美展示无关逻辑方式的语义：获取流、过滤姓张、过滤长度为 3 、逐一打印。代码中并没有体现使用线性循环或是其他任何算法进行遍历，我们真正要做的事情内容被更好地体现在代码中。

## 1.2 流式思想概述

- 注意：请暂时忘记对传统IO流的固有印象！整体来看，流式思想类似于工厂车间的“生产流水线”。

- 当需要对多个元素进行操作（特别是多步操作）的时候，考虑到性能及便利性，我们应该首先拼好一个“模型”步骤方案，然后再按照方案去执行它。

> 这张图中展示了过滤、映射、跳过、计数等多步操作，这是一种集合元素的处理方案，而方案就是一种“函数模型”。图中的每一个方框都是一个“流”，调用指定的方法，可以从一个流模型转换为另一个流模型。而最右侧的数字3 是最终结果。这里的filter、map、skip都是在对函数模型进行操作，集合元素并没有真正被处理。只有当终结方法count执行的时候，整个模型才会按照指定策略执行操作。而这得益于Lambda的延迟执行特性。


> 备注：“Stream流”其实是一个集合元素的函数模型，它并不是集合，也不是数据结构，其本身并不存储任何元素（或其地址值）。Stream（流）是一个来自数据源的元素队列
> 元素是特定类型的对象，形成一个队列。 Java中的Stream并不会存储元素，而是按需计算。
 数据源 流的来源。 可以是集合，数组 等。

和以前的Collection操作不同， Stream操作还有两个基础的特征：

- Pipelining: 中间操作都会返回流对象本身。 这样多个操作可以串联成一个管道， 如同流式风格（fluent style）。 这样做可以对操作进行优化， 比如延迟执行(laziness)和短路( short-circuiting)。
- 内部迭代： 以前对集合遍历都是通过Iterator或者增强for的方式, 显式的在集合外部进行迭代， 这叫做外部迭代。 Stream提供了内部迭代的方式，流可以直接调用遍历方法。

当使用一个流的时候，通常包括三个基本步骤：获取一个数据源（source）→ 数据转换→执行操作获取想要的结果，每次转换原有 Stream 对象不改变，返回一个新的 Stream 对象（可以有多次转换），这就允许对其操作可以像链条一样排列，变成一个管道。

## 1.3 获取流

`java.util.stream.Stream<T>`是Java 8新加入的最常用的流接口。（这并不是一个函数式接口。）

获取一个流非常简单，有以下几种常用的方式：

- 所有的Collection集合都可以通过stream默认方法获取流；
- Stream接口的静态方法of可以获取数组对应的流。


### 根据Collection获取流

首先，`java.util.Collection`接口中加入了default方法stream用来获取流，所以其所有实现类均可获取流。

```java
public class Demo03Collection {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        Stream<String> stream1 = list.stream();

        Set<String> set = new HashSet<>();
        Stream<String> stream2 = set.stream();

        Map<String,String> map = new HashMap<>();
        //获取键存到set
        Set<String> keySet = map.keySet();
        Stream<String> stream3 = keySet.stream();

        Collection<String> values = map.values();
        Stream<String> stream4 = values.stream();

        //获取键值对
        Set<Map.Entry<String, String>> entries = map.entrySet();
        Stream<Map.Entry<String, String>> stream5 = entries.stream();

        //数组转为Stream流
        Stream<Integer> stream6 = Stream.of(1, 2, 3, 4, 5);
        Integer[] arr = {1,2,3,4,5,6,7,8,9};
        Stream<Integer> stream7 = Stream.of(arr);

    }
}
```

### 根据Map获取流

java.util.Map接口不是Collection的子接口，且其K-V数据结构不符合流元素的单一特征，所以获取对应的流
需要分key、value或entry等情况：

### 根据数组获取流

如果使用的不是集合或映射而是数组，由于数组对象不可能添加默认方法，所以Stream接口中提供了静态方法
of，使用很简单：

## 1.4 常用方法

流模型的操作很丰富，这里介绍一些常用的API。这些方法可以被分成两种：

- **延迟方法**：返回值类型仍然是Stream接口自身类型的方法，因此支持链式调用。（除了终结方法外，其余方法均为延迟方法。）
- **终结方法**：返回值类型不再是Stream接口自身类型的方法，因此不再支持类似StringBuilder那样的链式调用。本小节中，终结方法包括count和forEach方法。

> 备注：本小节之外的更多方法，请自行参考API文档。

### 逐一处理：forEach

虽然方法名字叫forEach，但是与for循环中的“for-each”昵称不同。

该方法接收一个Consumer接口函数，会将每一个流元素交给该函数进行处理。

#### 复习Consumer接口

#### 基本使用：

```java
public class Demo04For_Each {
    public static void main(String[] args) {
        Stream<Integer> stream = Stream.of(1, 2, 3, 4, 5);
        //forEach 传入Consumer 遍历数据 消费数据
        stream.forEach(s-> System.out.println(s));
    }
}
```

### 过滤：filter

可以通过filter方法将一个流转换成另一个子集流。方法签名：

该接口接收一个Predicate函数式接口参数（可以是一个Lambda或方法引用）作为筛选条件。

#### 复习Predicate接口

此前我们已经学习过java.util.stream.Predicate函数式接口，其中唯一的抽象方法为：

```java
void forEach(Consumer<? super T> action);
```

该方法将会产生一个boolean值结果，代表指定的条件是否满足。如果结果为true，那么Stream流的filter方法
将会留用元素；如果结果为false，那么filter方法将会舍弃元素。

基本使用tream流中的filter方法基本使用的代码如：

```java
public class Demo05Filter {
    public static void main(String[] args) {
        //创建Stream流
        Stream<Integer> stream = Stream.of(1, 2, 3, 4, 5);
        //大于2的元素过滤
        Stream<Integer> integerStream = stream.filter((integer) -> {
            return integer > 2;
        });

        //输出
        integerStream.forEach(i-> System.out.println(i));
    }
}
```

**stream流属于管道流,只能被消费(使用)一次**  
**第一个Stream流调用完毕,数据结汇流转到下一个Stream上,第一个使用完,就会关闭**

在这里通过Lambda表达式来指定了筛选的条件：必须姓张。

### 映射：map

如果需要将流中的元素映射到另一个流中，可以使用map方法。方法签名：

该接口需要一个Function函数式接口参数，可以将当前流中的T类型数据转换为另一种R类型的流。

#### 复习Function接口

此前我们已经学习过java.util.stream.Function函数式接口，其中唯一的抽象方法为：

##### 这可以将一种T类型转换成为R类型，而这种转换的动作，就称为“映射”。

#### 基本使用

Stream流中的map方法基本使用的代码如：

```java
public class Demo06Map {
    public static void main(String[] args) {
        //创建Stream流
        Stream<String> stream = Stream.of("1", "2", "3", "4", "5");

        //使用map方法将字符串类型映射为Integer类型
        Stream<Integer> integerStream = stream.map(in -> {
            return Integer.parseInt(in);
        });

        //输出
        integerStream.forEach(i -> System.out.println(i));
    }
}
```

这段代码中，map方法的参数通过方法引用，将字符串类型转换成为了int类型（并自动装箱为Integer类对象）。

### 统计个数：count

正如旧集合Collection当中的size方法一样，流提供count方法来数一数其中的元素个数：

```java
public class Demo07Limt {
    public static void main(String[] args) {
        //创建Stream流
        Stream<String> stream = Stream.of("张三", "李四", "张流", "田七", "5");
        long count = stream.count();
        System.out.println(count);//5

    }
}
```

该方法返回一个long值代表元素个数（不再像旧集合那样是int值）。基本使用：

### 取用前几个：limit

limit方法可以对流进行截取，只取用前n个。

```java
public class Demo07Limt {
    public static void main(String[] args) {
        //创建Stream流
        Stream<String> stream = Stream.of("张三", "李四", "张流", "田七", "5");

        Stream<String> limit = stream.limit(2);
        
        limit.forEach(s-> System.out.println(s));

    }
}
```

参数是一个long型，如果集合当前长度大于参数则进行截取；否则不进行操作。基本使用：

### 跳过前几个：skip

如果希望跳过前几个元素，可以使用skip方法获取一个截取之后的新流：

如果流的当前长度大于n，则跳过前n个；否则将会得到一个长度为 0 的空流。基本使用：

```java
public class Demo07Limt {
    public static void main(String[] args) {
        //创建Stream流
        Stream<String> stream = Stream.of("张三", "李四", "张流", "田七", "5");

        Stream<String> skip = stream.skip(2);

        skip.forEach(s -> System.out.println(s));

    }
}
```

### 组合：concat

如果有两个流，希望合并成为一个流，那么可以使用Stream接口的静态方法concat：

备注：这是一个静态方法，与java.lang.String当中的concat方法是不同的。

该方法的基本使用代码如：

```java
public class Demo08Contat {
    public static void main(String[] args) {
        Stream<String> stream = Stream.of("张三", "李四", "张流", "田七", "5");
        Stream<String> stream2 = Stream.of("1", "2", "3", "4", "5");

        Stream<String> stringStream = Stream.concat(stream, stream2);

        stringStream.forEach(s-> System.out.println(s));

    }
}
```

## 1.5 练习：集合元素处理（传统方式）

### 题目

现在有两个ArrayList集合存储队伍当中的多个成员姓名，要求使用传统的for循环（或增强for循环）依次进行以
下若干操作步骤：

```java
1. 第一个队伍只要名字为 3 个字的成员姓名；存储到一个新集合中。
2. 第一个队伍筛选之后只要前 3 个人；存储到一个新集合中。
3. 第二个队伍只要姓张的成员姓名；存储到一个新集合中。
4. 第二个队伍筛选之后不要前 2 个人；存储到一个新集合中。
5. 将两个队伍合并为一个队伍；存储到一个新集合中。
6. 根据姓名创建Person对象；存储到一个新集合中。
7. 打印整个队伍的Person对象信息。
```

## 1.6 练习：集合元素处理（Stream方式）


将上一题当中的传统for循环写法更换为Stream流式处理方式。两个集合的初始内容不变，Person类的定义也不变。


等效的Stream流式处理代码为：

```java
public class Demo09StreamTest {
    public static void main(String[] args) {
        Stream<String> stream1 = Stream.of("张一一", "张二", "张三三", "田七七","张四四");
        Stream<String> stream2 = Stream.of("张aa", "李bb", "张cc", "田dd","王ff","张YY");

        //1. 第一个队伍只要名字为 3 个字的成员姓名；
        //2. 第一个队伍筛选之后只要前 3 个人；
        Stream<String> limit1 = stream1.filter(s -> s.length() == 3).limit(3);

        //3. 第二个队伍只要姓张的成员姓名；
        //4. 第二个队伍筛选之后不要前 2 个人；
        Stream<String> limit2 = stream2.filter(s -> s.startsWith("张")).skip(2);

        Stream<Person> personStream = Stream.concat(limit1, limit2).map(name -> new Person(name));

        personStream.forEach(s-> System.out.println(s));

    }
}
```

# 第二章 方法引用

在使用Lambda表达式的时候，我们实际上传递进去的代码就是一种解决方案：拿什么参数做什么操作。那么考虑
一种情况：如果我们在Lambda中所指定的操作方案，已经有地方存在相同方案，那是否还有必要再写重复逻辑？

## 2.1 冗余的Lambda场景

来看一个简单的函数式接口以应用Lambda表达式：

```java
@FunctionalInterface
public interface Printable {
    void print(String s);
}
```

在Printable接口当中唯一的抽象方法print接收一个字符串参数，目的就是为了打印显示它。那么通过Lambda
来使用它的代码很简单：

```java
public class Demo01PrintSimple {
    private static void printString(Printable data){
        data.print("Helloworld");
    }

    public static void main(String[] args) {
        printString(s-> System.out.println(s));
    }
}

```

其中printString方法只管调用Printable接口的print方法，而并不管print方法的具体实现逻辑会将字符串
打印到什么地方去。而main方法通过Lambda表达式指定了函数式接口Printable的具体操作方案为：拿到
String（类型可推导，所以可省略）数据后，在控制台中输出它。

## 2.2 问题分析

这段代码的问题在于，对字符串进行控制台打印输出的操作方案，明明已经有了现成的实现，那就是System.out
对象中的println(String)方法。既然Lambda希望做的事情就是调用println(String)方法，那何必自己手动调
用呢？

## 2.3 用方法引用改进代码

能否省去Lambda的语法格式（尽管它已经相当简洁）呢？只要“引用”过去就好了：

- 请注意其中的双冒号::写法，这被称为“方法引用”，而双冒号是一种新的语法。

## 2.4 方法引用符

双冒号::为引用运算符，而它所在的表达式被称为方法引用。如果Lambda要表达的函数方案已经存在于某个方法的实现中，那么则可以通过双冒号来引用该方法作为Lambda的替代者。

### 语义分析

例如上例中，System.out对象中有一个重载的println(String)方法恰好就是我们所需要的。那么对于
printString方法的函数式接口参数，对比下面两种写法，完全等效：

Lambda表达式写法：`s -> System.out.println(s);`
方法引用写法：`System.out::println`

第一种语义是指：拿到参数之后经Lambda之手，继而传递给`System.out.println`方法去处理。

第二种等效写法的语义是指：直接让`System.out`中的`println`方法来取代Lambda。两种写法的执行效果完全一
样，而第二种方法引用的写法复用了已有方案，更加简洁。

注:Lambda 中 传递的参数 一定是方法引用中 的那个方法可以接收的类型,否则会抛出异常

### 推导与省略

如果使用Lambda，那么根据“可推导就是可省略”的原则，无需指定参数类型，也无需指定的重载形式——它们都将被自动推导。而如果使用方法引用，也是同样可以根据上下文进行推导。

函数式接口是Lambda的基础，而方法引用是Lambda的孪生兄弟。

下面这段代码将会调用println方法的不同重载形式，将函数式接口改为int类型的参数：

- 由于上下文变了之后可以自动推导出唯一对应的匹配重载，所以方法引用没有任何变化：

这次方法引用将会自动匹配到println(int)的重载形式。

## 2.5 通过对象名引用成员方法

- 这是最常见的一种用法，与上例相同。如果一个类中已经存在了一个成员方法：

```java
public class MethidRerObject {
    public void printUpperCase(String str){
        System.out.println(str.toUpperCase());
    }
}
```

- 函数式接口仍然定义为：

```java
@FunctionalInterface
public interface Printable {
    void print(String s);
}
```

那么当需要使用这个printUpperCase成员方法来替代Printable接口的Lambda的时候，已经具有了
MethodRefObject类的对象实例，则可以通过对象名引用成员方法，代码为：

```java
public class Demo02 {
    private static void printString(Printable data){
        data.print("Helloworld");
    }

    public static void main(String[] args) {
        //printString(s-> System.out.println(s));

        printString(new MethidRerObject()::printUpperCase);
    }
}
```

## 2.6 通过类名称引用静态方法

由于在java.lang.Math类中已经存在了静态方法abs，所以当我们需要通过Lambda来调用该方法时，有两种写
法。首先是函数式接口：

```java
@FunctionalInterface
public interface Print2 {
    int printabs(int i);
}
```

```java
public class Demo03 {
    public static void print (int num,Print2 p){
        System.out.println(p.printabs(num));
    }
    public static void main(String[] args) {
        print(100,Math::abs);
    }
}
```

在这个例子中，下面两种写法是等效的：

Lambda表达式：`n -> Math.abs(n)`
方法引用：`Math::abs`

## 2.7 通过super引用成员方法

如果存在继承关系，当Lambda中需要出现super调用时，也可以使用方法引用进行替代。首先是函数式接口：

然后是父类Human的内容：

最后是子类Man的内容，其中使用了Lambda的写法：

但是如果使用方法引用来调用父类中的sayHello方法会更好，例如另一个子类Woman：

- 在这个例子中，下面两种写法是等效的：

Lambda表达式：`() -> super.sayHello()`
方法引用：`super::sayHello`

## 2.8 通过this引用成员方法

this代表当前对象，如果需要引用的方法就是当前类中的成员方法，那么可以使用“this::成员方法”的格式来使用方
法引用。首先是简单的函数式接口：

下面是一个丈夫Husband类：

开心方法beHappy调用了结婚方法marry，后者的参数为函数式接口Richable，所以需要一个Lambda表达式。
但是如果这个Lambda表达式的内容已经在本类当中存在了，则可以对Husband丈夫类进行修改：

如果希望取消掉Lambda表达式，用方法引用进行替换，则更好的写法为：


##### 在这个例子中，下面两种写法是等效的：

```
Lambda表达式：() -> this.buyHouse()
方法引用：this::buyHouse
```
## 2.9 类的构造器引用

由于构造器的名称与类名完全一样，并不固定。所以构造器引用使用类名称::new的格式表示。首先是一个简单
的Person类：

然后是用来创建Person对象的函数式接口：

要使用这个函数式接口，可以通过Lambda表达式：

##### 但是通过构造器引用，有更好的写法：

##### 在这个例子中，下面两种写法是等效的：

```
Lambda表达式：name -> new Person(name)
方法引用：Person::new
```
## 2.10 数组的构造器引用

数组也是Object的子类对象，所以同样具有构造器，只是语法稍有不同。如果对应到Lambda的使用场景中时，
需要一个函数式接口：

在应用该接口的时候，可以通过Lambda表达式：

##### 但是更好的写法是使用数组的构造器引用：
