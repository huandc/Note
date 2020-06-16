# 基础

## 2020/6/12

### elements

- **javac 编译 .java -> .class**  
- **java 运行**  

```java
public class HelloWorld{
    //程序的起点main
        public static void main(String[] args)
        //打印内容
            System.out.println("Hello World");
        }
    }
```

### 关键字

  1. 完全小写的字母 public  
  2. 有特殊颜色的  
  
### 标识符命名规则

  1. 标识符 英文字母 数字 美元符号 下划线  
  2. 不能数字开头  
  3. 不能是关键字  
  
### 命名规范

  1. 类名规范 首字母大写 后面每个单词首字母大写 大驼峰 HelloWorld  
  2. 变量名规范/方法名   首字母小写，后面每个单词首字母大写 helloWorld  
  
### 常量：程序中固定不变的

   1. 字符串常量:双引号引起来的部分         eg: "1265ada"  
   2. 整型常量:直接数字 整数                11 100 30 -25  
   3. 浮点数常量: 带小数点的数字             2.5 10.00 -3.10 0.0  
   4. 字符常量: 单引号引起来的单个字符，只能有一个        'a' '5' '!'  
   5. 布尔常量:                             true false  
   6. 空常量： null 没有任何数据。  

```java
public static void main(String[] args) {
    //打印字符串常量
    System.out.println("abc");
    System.out.println("");//字符串两个双引号中间的内容为空
    System.out.println("xyz");

    //整数常量
    System.out.println(30);
    System.out.println(-500);

    //浮点数常量
    System.out.println(3.14);
    System.out.println(23.5);

    //字符常量
    System.out.println('A');
    System.out.println('1');

    //布尔常量
    System.out.println(true);
    System.out.println(false);
}
```

### 基本数据类型

- 整数型  `byte` `short` `int` `long`  
- 浮点型  `float` `double`  
- 字符型  `char`  
- 布尔型  `boolean`  
  
### 引用数据类型

- 字符串  
- 数组  
- 类  
- 接口  
- Lambda  
- tips:

 1. 字符串不是基本类型，而是引用类型  
 2. 浮点型可能只是一个近似值，并非精确值  
 3. 数据范围和字节数不一定相关  `float` 数据范围比`long`更加广泛 但 `float`是4字节 `long`  8字节  
 4. 浮点数默认`double`, 使用`float` 后缀F。  
  整数，默认int 使用long 后缀L。  

## 2020/6/13  

### 变量 运行期间可以改变的量

   **数据类型  变量名称；**
   **变量名称 = 数据值**  
   **数据类型 变量名称 = 数据值**  

```java
public class Demo02Variable {
    public static void main(String[] args) {
        //创建一个变量
        //数据类型 变量名称
        int num1;
        num1 = 20;
        System.out.println(num1);
        //改变数字
        num1 = 11;
        System.out.println(num1);
        //使用一部
        //数据类型 变量名称 = 数据值
        int num2 = 5;
        System.out.println(num2);
        System.out.println("==============");

        byte num3 = 30;
        System.out.println(num3);

        short num5 = 50;
        System.out.println(num5);

        long num6 = 3000000000L;
        System.out.println(num6);

        float num7 = 2.5F;
        System.out.println(num7);

        double num8 = 1.2;
        System.out.println(num8);

        char char1 = 'A';
        System.out.println(char1);

        char1 = '中';
        System.out.println(char1);

        boolean bool = true;
        System.out.println(bool);


        boolean bool2 = bool;
        System.out.println(bool2);
    }
}
```  

### 使用多个变量注意事项

1.多个变量名称不能重复。  
2.`float`和`long` 的F和L后缀不能丢。  
3.`byte`、`short` 数据值不能超出范围。  
4.没有赋值的变量不能直接使用。  
5.变量的使用不能超出作用域的范围。  
6.可以通过一个语句创建多个变量。**不推荐**  

### 数据类型转换

当数据类型不一样时，会发生数据类型转换。  

- 自动类型转换(隐式)

1. 特点：代码不需要特殊处理，自动完成。  
2. 规则：数据范围从小到大。  

```java
public class DataType {
    public static void main(String[] args) {
        System.out.println(1024);//整数，默认int类型
        System.out.println(3.14);//浮点数，默认double类型
        // 左边 long类型 , 右边默认的int类型，左右不一样
        //int -->long 符合从小到大 发生了自动转换
        long num1 = 100;
        System.out.println(num1);//100

        //左边double 右边float
        //float -->double 从小到大 发生自动转换
        double num2 = 2.5F;
        System.out.println(num2);

        //long --> float 从小到大。
        float num3= 30L;
        System.out.println(num3);
    }
}
```  

- 强制类型转换(显式)

 1. 特点：代码进行特殊格式处理，不能自动完成。
 2. 范围小的类型 范围小的变量名 = (范围小的类型) 范围大的数据

- **注意事项**

 1. 强制类型转换可能发生精度损失，数据溢出。  
 2. _`byte`/`short`/`char`_ 这三种可以发生数学运算 如“+”。  
 3. _`byte`/`short`/`char`_ 在运算是会首先提升为int然后进行计算。  
 4. **boolean** 类型不能发生数据类型转换

```java
public class DataType2 {
    public static void main(String[] args) {
        //左边int 右边long
        //long --> int 不是从小到大，不能自动转换
        // 范围小的类型 范围小的变量名 = (范围小的类型) 范围大的数据
        int num = (int) 100L;
        System.out.println(num);

        //long强制转换成int类型
        int num2 = (int) 6000000000L;
        System.out.println(num2);//1705032704  溢出

        //double --> int  强制类型转换
        int num3 = (int) 3.5;
        System.out.println(num3);// 3 精度损失

        char c1 = 'A';
        System.out.println((char) (c1 + 1));

        byte num4 = 40;
        byte num5 = 50;
        //byte + byte --> int + int =int;
        //byte result1 = num4 + num5;
        int result1 = num4 + num5;
        System.out.println(result1);//不兼容的类型: 从int转换到byte可能会有损失

        short num6 = 60;
        //byte + short --> int + int = int;
        // int 强制转换为short 要保证不超出范围
        short result2 = (short) (num4 + num6);
        System.out.println(result2);
    }
}
```  

* * *
对于_`byte`/`short`/`char`_三种类型，如果右侧赋值没有超过范围，那么Java编译器会自动隐含的补上_(`byte`)/(`short`)/(`char`)  

```java
public class Notice{
    public static void main(String[] args){
        byte num1 = /*(byte)*/ 30;
        System.out.println(num1)//30

        //int --->  char 
        char zifu = /*(char)*/ 65;
        System.out.println(zifu)//A
    }
}
```  

* * *  
再给变量进行赋值时，如果右侧的表达式都是常量，没有任何变量，那么编译器将会直接将若干和常量表达式计算得到结果。  
`short result = 5 + 8;` //右侧全是常量，得到的结果即使  
`short result = 13;`  
这就是**编译器的常量优化**，一旦有变量参与，则不能进行这种优化。  


### 编码表  

- **ASCII码表**
- **Unicode码表**   0-127 与ASCII一样  

48 - '0'  
65 - 'A'  
97 - 'a'  

```java
public class Demo3DataTyperChar {
    public static void main(String[] args) {
        char char1 = '1';
        System.out.println(char1 + 0);

        char char3 = 'c';

        //左侧int 类型 右侧char类型
        //char --> int 自动类型转换
        int num = char3;
        System.out.println(num);//99

        char char4 = '中';
        System.out.println(char4 + 0);
    }
}
```

### 运算符

进行特点操作的符号。+  
表达式: 运算符连起来的式子。20+5  

- 算术运算符  
<kbd>**+**</kbd>    加  
<kbd>**-**</kbd>    减  
<kbd>__\*__</kbd>   乘  
<kbd>**/**</kbd>    除 **被除数 / 除数 = 商 。。。 余数** (整数表达式中 整数除以整数仍然是整数，只看商。)  
<kbd>**%**</kbd>    取余  只有对于整数除法来说取模才有意义。  
- 注意事项

 1. 不同类型的数据，结果将是范围大的那种。

```java
public class Demo4Operator {
    public static void main(String[] args) {
        System.out.println(20 + 30);
        //先计算再输出
        int a = 20;
        int b = 30;
        System.out.println(a - b);
        //常量变量混合使用
        System.out.println(a * 10);

        int x = 10;
        int y = 3;
        int result = x / y;
        System.out.println(result);
        int result2 = x % y;
        System.out.println(result2);//余数

        // int + double --> double + double = double
        double result3 = x + 2.5;
        System.out.println(result3);

    }
}
```

### **加号 +** 三种用法  

 1. 数值来说就是加法。  
 2. 对于字符来说 char被提升为int 再进行计算。
 3. 对于字符串String 来说，代表字符串连接操作。  
**(任何数据类型和字符串进行连接的时候，都会变成字符串)**  

```java
public class Demo5Plus {
    public static void main(String[] args) {
        //字符串类型的变量基本使用
        String str1 = "Hello";
        System.out.println(str1);

        System.out.println("Hello" + "World");
        String str2 = "Java";
        System.out.println(str2 + 20);
        //优先级
        System.out.println(str2 + 20 + 30);//Java2030
        System.out.println(str2 + (20 + 30));//Java50
    }
}
```  

### 自增自减运算符  

- 自增运算符 **++**  
- 自减运算符 **--**  
基本含义：加一或者减一  
使用格式：++num num++  
使用方式：  
        1. 单独使用：num++ 和 ++num 没有区别。  
        2. 混合使用;  **++num 先加一再使用。  num++先使用，再加一。**  
**注意事项**  
只有变量才有自增自减。

```java
public class Demo6Operator {
    public static void main(String[] args) {
        int num1 = 10;
        System.out.println(num1);//10
        ++num1;//单独使用
        System.out.println(num1);//11
        num1++;
        System.out.println(num1);//12
        System.out.println("**************");

        //与打印语句混合
        int num2 = 20;
        System.out.println(num2);//20
        System.out.println(++num2);//先++，打印21
        System.out.println(num2++);//先打印21，再++
        System.out.println(num2);//22
        System.out.println("**************");

        int num4 = 40;
        int result1 = --num4;//先--，再给result
        System.out.println(result1);//39
        System.out.println(num4);//39

        int num5 = 50;
        int result2 = num5--;//先赋值，再--
        System.out.println(result2);//50
        System.out.println(num5);//49

        int x = 10;
        int y = 20;
        //  11 + 20 = 31
        int result3 = ++x + y--;
        System.out.println(result3);
        System.out.println(x);//11
        System.out.println(y);//19
    }
}
```  

### 赋值运算符  

- 基本赋值运算符  
  <kbd>=</kbd>  右侧的值赋值给左侧;  
  `int a = 30;`  
  符合赋值运算符  
  <kbd>+=</kbd>  `a += 1;   -----> a = a + 1;`  
  <kbd>-=</kbd>  `a -= 1;   -----> a = a - 1;`  
  <kbd>*=</kbd>  `a *= 1;  -----> a = a * 1;`  
  <kbd>/=</kbd>  `a /= 1;   -----> a = a / 1;`  
  <kbd>%=</kbd>  `a %= 1;   -----> a = a % 1;`  

1. 变量才可以赋值运算;  
2. 符合赋值运算隐含一个强制类型转换。  
```java
public class Demo7Operator {
    public static void main(String[] args) {
        int a = 10;
        a += 5;  //a = a + 5
        System.out.println(a);//15

        int x = 10;
        x %= 3;
        System.out.println(x);//1

        byte num = 30;
        num += 5;
        //num = byte + int
        //num = int + int
        //num = (byte) int
        System.out.println(num);
    }
}
```  

### 比较运算符

等于                        <kbd>==</kbd>  
小于                        <kbd><</kbd>  
大于                        <kbd>></kbd>  
大于等于                    <kbd>>=</kbd>  
小于等于                    <kbd><=</kbd>  
不等于                      <kbd>!=</kbd>  

1. 比较运算一定是一个boolean 值, true 或者 false.  
2. 多次判断不能连着写。  1>x>3  **错误**  

```java
public class Demo8Operator {
    public static void main(String[] args) {
        System.out.println(10 > 5);//true
        int num1 = 10;
        int num2 = 12;
        System.out.println(num1 < num2);//true
        System.out.println(num2 >= 100);//false
        System.out.println(num2 <= 100);//true
        System.out.println("*************");
        System.out.println(10 == 10);//true
        System.out.println(20 != 10);//true
    }
}
```  

## 2020/6/14

### 逻辑运算符

- 与  <kbd>&&</kbd>  
- 或  <kbd>||</kbd>  
- 非  <kbd>!</kbd>  

**短路  <kbd>&&</kbd>  <kbd>||</kbd>**  
左边如果可以判断出 则不判断后面  

- 注意事项  

1. 逻辑运算只能用域boolean值。  
2. 与 或 左右各有一个boolean值，取反只有一个boolean值。  
3. 与 或 如果多个条件 可以连续写。 多个条件 A && B && C。

```java
public class Demo9Logic {
    public static void main(String[] args) {
        System.out.println(true && false);//false
        System.out.println(3 < 4 && 10 > 5);//true
        System.out.println(true || true);//true
        System.out.println(true || false);//true
        System.out.println(false || false);//false
        System.out.println(true);//true
        System.out.println(!true);//false
        System.out.println("************");
        //短路
        int a = 10;
        System.out.println(3 > 4 && ++a < 100);//false
        //3>4 为false 则短路 后面执行判断
        System.out.println(a);//10
        int b = 20;
        System.out.println(3 < 4 || ++b < 100);//true
        System.out.println(b);//20
    }
}
```  

### 三元运算符  

- 一元运算符 一个数据就可以操作。 !  ++  --  
- 二元运算符 两个数据就可以操作。 +  = +=  
- 三元运算符 三个数据就可以操作。  
**数据类型 变量名称 = 条件判断 ? 表达式A : 表达式Ｂ**  
首先判断是否成立：  
成立    将A的值赋值给左侧  
不成立  将B的值赋值给左侧  
注意事项:  

1. 同时保证A、B 符合左侧数据类型的要求  
2. 三元运算符的结果必须被使用  
`  

### 流程

顺序结构 

```java
public class Demo01Sequence {
    public static void main(String[] args) {
        System.out.println("今天气不错");
        System.out.println("风和日丽");
        System.out.println("下午没课");
        System.out.println("挺爽");
    }
}
```  

判断结构  

- 单if语句

```java
if(关系表达式){
    语句;
}
```

- if...else语句  

```java
if(关系表达式){
    语句1;
}else{
    语句2;
}
```  

```java
public static void main(String[] args) {
    int score = 1000;
    if (score < 0 || score > 100) {
        System.out.println("成绩错误");
    } else if (score >= 90 && score <= 100) {
        System.out.println("优秀");
    } else if (score >= 80 && score < 90) {
        System.out.println("好");
    } else if (score >= 70 && score < 80) {
        System.out.println("良好");
    } else if (score >= 60 && score < 70) {
        System.out.println("及格");
    } else {
        System.out.println("不及格");
    }
}```  

选择结构  
```java
switch(表达式){
    case 常量值1:
    语句1;
    break;
    case 常量值2:
    语句2
    break;
    .....
    default:
    语句n+1;
    break;
}
```  

- 执行流程  
首先计算表达式的值，和`case`进行依次比较，执行对应值的语句，遇到`break`结束。  
最后，如果都不匹配，执行`defaul`语句体部分。  

```java
public static void main(String[] args) {
    int num = 1;
    switch (num){
        case 1:
            System.out.println("星期一");break;
        case 2:
            System.out.println("星期二");break;
        case 3:
            System.out.println("星期三");break;
        case 4:
            System.out.println("星期四");break;
        case 5:
            System.out.println("星期五");break;
        case 6:
            System.out.println("星期六");break;
        case 7:
            System.out.println("星期日");break;
        default:
            System.out.println("error");break;
    }
}
```  

1. 多个`case`后面的数值不可以重复。  
2. `switch` 只能是下列类型。  
基本数据类型 `byte/char/short/int`  
引用数据类型 `String、enum`  
3. `switch` 格式可以灵活：前后顺序可以颠倒，`break`不可以省略。  

循环结构  

1. 初始化语句：最先执行，只执行一次。  
2. 条件判断：如果成立，循环继续。不成立，推出循环。  
3. 循环体：重复执行的语句。
4. 步进语句：每次循环后执行的语句。  

- `for`循环格式  

```java
for(初始表达式; 布尔表达式; 步进表达式){  
    循环体;  
}
```  

```java
public static void main(String[] args) {
    for (int i = 1;i<=100;i++){
        System.out.println("这是第"+i+"次");
    }
}
```

- `while`循环格式  

```java
初始表达式;
while(布尔表达式){
    循环体;  
    步进表达式;  
}
```  

- `do....while` 循环格式

```java
初始表达式;
do{
    循环体;  
    步进表达式;  
}while(布尔表达式)
```  

区别：  

1. 如果条件从来没有满足过，`for`和`while`循环执行0次，`do...while`执行一次。  
2. `for`循环的变量只能在循环内部使用。`while`、`do...while`循环初始化变量在外部，循环之外可以继续使用。  

- `break`关键字:  

1. 用在`switch`语句中，一旦执行，结束。  
2. 循环语句中，一旦执行，循环立即结束。  

- `continue`关键字:  

一旦执行,跳过当前次循环,开始下一次循环.  

```java
public static void main(String[] args) {
    for (int i = 1; i <= 10; i++) {
        if (i % 2 == 0) {
            continue;
        }
        //不打印偶数次.
        System.out.println("Hello " + i);
    }
}
```  

- 死循环  

```java
while (true) {
    循环体;
}
```

- 循环嵌套  

```java
for(初始表达式1 ; 循环条件1 ; 循环条件2) {
    for(初始表达式2 ; 循环条件3 ; 循环条件4)){
        循环体;
    }
}
```

```java
    public static void main(String[] args) {
        for (int hour = 0; hour < 24; hour++) {
            for (int minute = 0; minute < 60; minute++)
                for (int second=0;second<60;second++){
                System.out.println(hour + ":" + minute);
        }
    }
```

### 方法

- 方法的定义基本格式  

```java
public static void 方法名(){  
    方法体;  
}  
```  

方法名称使用小驼峰。  
方法体：大括号可以包括任意语句。  
注意事项：  

 1. 方法定义先后顺序无所谓。  
 2. 方法的定义不能产生嵌套包含关系。  
 3. 方法定义好，要进行方法的[调用]。  
调用格式: ```方法名称();``

```java
public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            print();//調用5次打印
        }
    }
    public static void print() {
        for (int j = 0; j < 20; j++) {
            System.out.print("*");//循环打印20次*
        }
        System.out.println();//换行
    }
```  

* * *

方法其实就是若干语句的功能集合.  

- 参数: 进入方法的数据.  
- 返回值: 从方法出来的数据.  

完整格式:  

```java
修饰符 返回值类型 方法名称(参数类型 参数名称, ...){
    方法体;
    return 返回值;
}
```  

修饰符: 现阶段, `public static`  
返回值类型: 方法产生的数据结果类型  
方法名称:　方法名字　小驼峰　　
参数类型：进入的数据的类型  
参数名称: 进入方法的数据的变量名  
方法体: 方法需要做的事,若干行代码  
`return`: 停止当前方法, 将结果返回  
返回值: 产生的数据结果  
**return 后面返回值类型 与方法名的返回值类型对应**  

- 三种调用格式  

1. 单独调用  
2. 打印调用  
3. 赋值调用  

```java
public static void main(String[] args) {
    //单独调用
    sum(10, 20);
    //打印调用
    System.out.println(sum(10, 20));
    //赋值调用
    int s = sum(10, 20);
    System.out.println(s);
}
public static int sum(int a, int b) {
    return a + b;
}
```

有参数:  小括号有内容,当一个方法需要一个数据条件才能完成认为的时候.  
无参数: 小括号留空,方法不需要数据条件就能独立完成.  

- 注意事项

1. 方法的定义在类当中,但是不能嵌套定义方法.  
2. 方法定义后不会执行,只有调用才能执行.  
3. 有返回值 必须 `return 返回值`  与方法返回值类型对应.  
4. 对于void 只能写`return`; 不能有返回值.  
5. 对于方法最后一行的`return`可以省略.  
6. 一个方法当中可以有多个`return`, 但保证同时只有一个会被执行.  

* * *

- **方法的重载**  
功能类似,参数列表不一样.  
**重载(Overload)**  
多个方法的名称一样,参数列表不一样.  

```java
public static void main(String[] args) {

    System.out.println(sum(10, 20));
    System.out.println(sum(10, 20, 30));
    System.out.println(sum(10, 20, 30, 40));
}

public static int sum(int a, int b) {
    return a + b;
}

public static int sum(int a, double b) {
    return (int) (a + b);
}

public static int sum(int a, int b, int c) {
    return a + b + c;
}

public static int sum(int a, int b, int c, int d) {
    return a + b + c + d;
}
```  

- 相关  

1. 参数个数不同.  
2. 参数类型不同.  
3. 参数的多类型顺序不同.  

- 无关

1. 与参数名称无关.  
2. 与方法的返回值类型无关.  

### 数组

是一种容器,存放多个数据值.  

1. 数组是一种引用数据类型.  
2. 数组当中的多个数据类型必须一致.  
3. 数组的长度在运行期间,不可以改变.  

数组的初始化  

1. 动态初始化(指定长度) 元素自动默认值
整数 --- 0  
浮点型 ---0.0  
字符类型 ---'/u0000'  
布尔类型 --- false  
引用类型 --- null  

2. 静态初始化(指定内容)  
虽然静态初始化没有告诉长度,但根据元素个数,可以推算出来长度.  
3. 静态初始化省略格式  

```java
//动态初始化
数据类型[] 数组名称 = new 数据类型[数组长度];
int[] arr = new int[300];

int[] arr;
arr = new int[5];

//静态初始化
数据类型[] 数组名称 = new 数据类型[] {元素1, 元素2, ...};
int[] arr2 = new int[] { 5,15,25};

//省略格式
数据类型[] 数组名称 = {元素1, 元素2, ...};
String[] arr3 = {"Hello", "World", "Java"};

int[] array;
array = {11 , 21 , 31};

```

如果不确定数组当中的内容,用动态初始化,否则确定的内容时用静态初始化.  

- **内存划分**  

1. **栈内存 (Stack)** : 方法的局部变量, 方法的参数或者方法的内部变量._方法的运行一定在栈当中_.  
作用域:一旦超出作用域,立刻从栈内存当中消失.  
2. **堆 (Heap)** : new出来的东西,都在堆当中,16进制.  
3. **方法区 (Method Area)** : 存储.class相关信息,包含方法的信息.  
4. 本地方法栈 (Native Method Stack) : 与操作系统相关.  
5. 寄存器 (pc Register) : 与CPU相关.  

访问数组元素,索引编号不存在,那么发生数组索引越界异常. `ArrayIndexOutOfBoundsException`.  
空指针异常: 所有的引用类型,都可以赋值为null值,表示其中什么都没有. 数组必须进行new初始化才能使用,如果只是赋值了null,没有new创建,那么将发生空指针异常`NullPointerException`  
数组一旦创建,程序运行期间,长度不可改变.  

一个方法可以有0、1、多个参数. 不能有多个返回值.  
如果要返回多个值,使用数组返回.  

```java
public static void main(String[] args) {
    int[] arr = new int[2];
    arr = fun(10, 20, 30);
    for (int i = 0; i < arr.length; i++) {
        System.out.println(arr[i]);
    }
}

public static int[] fun(int a, int b, int c) {
    int sum = a + b + c;
    int avg = sum / 3;
    int[] arr = {sum, avg};
    return arr;
}
```

### 面向对象

面向过程: 实现功能时,处理每个步骤. 强调**过程**  
面向对象: 实现功能时,不关心具体的步骤.强调**对象**  

```Java
public static void main(String[] args) {
    int[] array = {10, 20, 30, 40, 50};
    //打印格式[10, 20, 30, 40, 50 ]
    //面向过程
    System.out.print("[");
    for (int i = 0; i < array.length; i++) {
        if (i == array.length - 1) {
            System.out.print(array[i] + "]");
        } else {
            System.out.print(array[i] + ", ");
        }
    }
    //面向对象
    //找一个JDK提供的toString方法.
    System.out.println(Arrays.toString(array));
}
```  

- 特点: **封装 继承 多态**  

类与对象的关系:  

- **类** 是一组相关属性和行为的集合.一类事物的模板.  
- **属性**: 状态信息.  
- **行为**: 动作,能够做什么.  

- **对象** 对象是类的一个实例,具有该类事物的属性和行为.  

类和对象的关系  

- 类是对一类事物的描述,是**抽象**的.  
- 对象是一类事物的实力,是**具体**的.  
- **类是对象的模板,对象是类的实体**.  

定义一个类:
**成员变量**: 对应事物的**属性**.

**成员方法**: 对应事物的**行为**.  

- 注意事项:  

1. 成员变量直接定义在类当中,方法外.  
2. 成员方法不屑static关键字.  

创建一个对象:  

1. 导包 指出使用的类在什么位置.  
import 包名称.类名称;
`import cn.handc.day04.Demo06.Student`  
对于和当前类属于同一个包,可以不写导包.  
2. 创建  
类名称 对象名 = new 类名称();  
`Student stu = new Student();`  
3. 使用  
使用成员变量: 对象名.成员变量  
使用成员方法: 对项目.成员方法名(参数)  

成员变量未赋值,将会有默认值.  

```java
public class Phone {
    //成员变量
    String brand;
    double priice;
    String color;
    //成员方法
    public void call(String who){
        System.out.println("给"+who+"打电话");
    }
    public void sendMessage(){
        System.out.println("群发短信");
    }
}
public static void main(String[] args) {
    Phone p = new Phone();
    System.out.println(p.brand);//null
    System.out.println(p.color);//null
    System.out.println(p.priice);//0.0
    System.out.println("***********");

    p.brand="苹果";
    p.color="黑色";
    p.priice=1888.88;
    System.out.println(p.brand);//苹果
    System.out.println(p.color);//黑色
    System.out.println(p.priice);//1888.88

    p.call("乔布斯");
    p.sendMessage();
}
```  

**一个对象内存图**  
![Demo01](images/01_Obj_Memory.PNG)

**两个对象同一个方法**

![Demo02](images/02_TwoObj_OnewMethod.PNG)
