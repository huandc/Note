
 # 2020/6/12

javac 编译 .java -> .class  
java 运行  

  ###  后面代表定义一个类的名称，Java当中源代码的基本组成单位

```java
public class HelloWorld{
    //程序的起点main
        public static void main(String[] args)
        //打印内容
            System.out.println("Hello World");
        }
    }
```


  ###  关键字  
  1.完全小写的字母 public  
  2.有特殊颜色的  
  
  ###  标识符命名规则  
  1.标识符 英文字母 数字 美元符号 下划线  
  2.不能数字开头   
  3.不能是关键字  
  
  ###  命名规范  
  1.类名规范 首字母大写 后面每个单词首字母大写 大驼峰 HelloWorld  
  2.变量名规范/方法名   首字母小写，后面每个单词首字母大写 helloWorld  
  
  ###  常量：程序中固定不变的。  
  分类：  
   1.字符串常量:双引号引起来的部分         eg: "1265ada"  
   2.整型常量:直接数字 整数                11 100 30 -25  
   3.浮点数常量: 带小数点的数字             2.5 10.00 -3.10 0.0  
   4.字符常量: 单引号引起来的单个字符，只能有一个        'a' '5' '!'  
   5.布尔常量:                             true false  
   6.空常量： null 没有任何数据。  

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

###  基本数据类型：  
  整数型  byte short int long  
  浮点型  float double  
  字符型  char  
  布尔型  boolean  
  
### 引用数据类型：  
  字符串  
  数组  
  类  
  接口  
  Lambda  
 1.字符串不是基本类型，而是引用类型  
 2.浮点型可能只是一个近似值，并非精确值  
 3.数据范围和字节数不一定相关  float 数据范围比long更加广泛 但 float是4字节 long  8字节  
 4.浮点数默认double, 使用float 后缀F。  
  整数，默认int 使用long 后缀L。  


# 2020/6/13  

### 变量 运行期间可以改变的量。  
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

### 使用多个变量注意事项。  
1.多个变量名称不能重复。  
2.float和long 的F和L后缀不能丢。  
3.byte、short 数据值不能超出范围。  
4.没有赋值的变量不能直接使用。  
5.变量的使用不能超出作用域的范围。 
* * *
6.可以通过一个语句创建多个变量。**不推荐** 