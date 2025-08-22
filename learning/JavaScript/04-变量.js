// *变量
/* 变量在JavaScript中就是用一个变量名表示
变量名是大小写英文、数字、$和_的组合，且不能用数字开头。
变量名也不能是JavaScript的关键字，如if、while等。
申明一个变量用var语句，每个变量只能用var申明一次 */
var a;  // 申明了变量a，此时a的值为undefined
var $b = 1;  // 申明了变量$b，同时给$b赋值，此时$b的值为1
var s_007 = '007';  // s_007是一个字符串
var Answer = true;  // Answer是一个布尔值true
var t = null;  // t的值是null

// 在JavaScript中，使用等号=对变量进行赋值。
// 可以把任意数据类型赋值给变量，同一个变量可以反复赋值，而且可以是不同类型的变量
var a = 123;  // a的值是整数123
a = 'ABC';  // a变为字符串

// 要显示变量的内容，可以用console.log(x)
var x = 100;
console.log(x);

// *strict模式
/* JavaScript在设计之初，为了方便初学者学习，并不强制要求用var申明变量。
这个设计错误带来了严重的后果：如果一个变量没有通过var申明就被使用，那么该变量就自动被申明为全局变量
在同一个页面的不同的JavaScript文件中，如果都不用var申明，恰好都使用了变量i，将造成变量i互相影响，产生难以调试的错误结果。
使用var申明的变量则不是全局变量，它的范围被限制在该变量被申明的函数体内（函数的概念将稍后讲解），同名变量在不同的函数体内互不冲突。
为了修补JavaScript这一严重设计缺陷，ECMA在后续规范中推出了strict模式
在strict模式下运行的JavaScript代码，强制通过var申明变量，未使用var申明变量就使用的，将导致运行错误。 */
// 启用strict模式的方法是在JavaScript代码的第一行标明
'use strict';
// 不用var申明的变量会被视为全局变量，为了避免这一缺陷，所有的JavaScript代码都应该使用strict模式。

// 另一种申明变量的方式是let，这也是现代JavaScript推荐的方式