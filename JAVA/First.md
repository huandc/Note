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

- 整数型  byte short int long  
- 浮点型  float double  
- 字符型  char  
- 布尔型  boolean  
  
### 引用数据类型

- 字符串  
- 数组  
- 类  
- 接口  
- Lambda  
- tips:

 1. 字符串不是基本类型，而是引用类型  
 2. 浮点型可能只是一个近似值，并非精确值  
 3. 数据范围和字节数不一定相关  float 数据范围比long更加广泛 但 float是4字节 long  8字节  
 4. 浮点数默认double, 使用float 后缀F。  
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
2.float和long 的F和L后缀不能丢。  
3.byte、short 数据值不能超出范围。  
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
 2. _byte/short/char_ 这三种可以发生数学运算 如“+”。  
 3. _byte/short/char_ 在运算是会首先提升为int然后进行计算。  
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
对于_byte/short/char_三种类型，如果右侧赋值没有超过范围，那么Java编译器会自动隐含的补上_(byte)/(short)/(char)  

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

### 方法

- 方法的定义  

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
调用格式: ```方法名称();```  

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

选择结构

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

循环结构  
