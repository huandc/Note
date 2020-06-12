
 2020/6/12
 javac 编译 .java -> .class
 java 运行 

//后面代表定义一个类的名称，Java当中源代码的基本组成单位
''''java
public class HelloWorld{
    //程序的起点main
        public static void main(String[] args)
        //打印内容
            System.out.println("Hello World");
        }
    }
''''


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
 

public static void main(String[] args) {
    //打印字符串常量
    System.out.println("abc");
    System.out.println(" ");//字符串两个双引号中间的内容为空
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


  ###  基本数据类型：  
  整数型  byte short int long  
  浮点型  float double  
  字符型  char  
  布尔型  boolean  
  
  ###  引用数据类型：  
  字符串  
  数组   
  类   
  接口   
  Lambda
 


