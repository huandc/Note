# Note 学习笔记

* * *
```# 一级标题 ``` 
# 一级标题  
```## 二级标题 ``` 
## 二级标题
```### 三级标题```  
### 三级标题  

* * *
# 段落格式
Markdown 段落没有特殊的格式，直接编写文字就好，段落的换行是使用两个以上空格加上回车  
你好<kbd>空格</kbd><kbd>空格</kbd>  
我在这里。<kbd>空格</kbd><kbd>空格</kbd>  

你好  
我在这里  

* * *
```*斜体文本*```  
*斜体文本*  

```**粗体文本** ```  
**粗体文本**

```***粗斜体文本***  ```  
***粗斜体文本***
* * *

# 删除线
如果段落上的文字要添加删除线，只需要在文字的两端加上两个波浪线 ~~ 即可，实例如下：  
```
RUNOOB.COM  
GOOGLE.COM  
~~BAIDU.COM~~  
```
RUNOOB.COM  
GOOGLE.COM 
~~BAIDU.COM~~
* * *
# 下划线
下划线可以通过 HTML 的 <u> 标签来实现  
```
<u>带下划线文本</u>
```  
<u>带下划线文本</u>
* * *

# Markdown 代码
如果是段落上的一个函数或片段的代码可以用反引号把它包起来（\`），例如：  
使用\`printf()\` 函数  
使用`printf()` 函数  

你也可以用 \`\`\` 包裹一段代码，并指定一种语言（也可以不指定）：  

```
```java
public class Main {

    public static void main(String[] args) {

        System.out.println("Hello World!");
    }
}
```
```  

```javascript
$(document).ready(function () {
    alert('RUNOOB');
});
```