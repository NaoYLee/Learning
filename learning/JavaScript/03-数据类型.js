// *Number
// JavaScript不区分整数和浮点数，统一用Number表示
123;  // 整数123
0.456;  // 浮点数0.456
1.2345e3;  // 科学计数法表示1.2345x1000，等同于1234.5
-99;  // 负数
NaN;  // NaN表示Not a Number，当无法计算结果时用NaN表示
Infinity;  // Infinity表示无限大，当数值超过了JavaScript的Number所能表示的最大值时，就表示为Infinity

// **Number的四则运算
1 + 2;  // 3
(1 + 2) * 5 / 2;  // 7.5
2 / 0;  // Infinity
0 / 0;  // NaN
10 % 3;  // 1 求mod
10.5 % 3;  // 1.5

// JavaScript的整数最大范围不是±2^63，而是±2^53
// 打印Number能表示的最大整数:
console.log(Number.MAX_SAFE_INTEGER);  // 9007199254740991

// 要精确表示比253还大的整数，可以使用内置的BigInt类型，它的表示方法是在整数后加一个n
var bi1 = 9223372036854775807n;
var bi2 = BigInt(12345);
var bi3 = BigInt("0x7fffffffffffffff");
console.log(bi1 === bi2);  // false
console.log(bi1 === bi3);  // true
console.log(bi1 + bi2);  // 9223372036854788152n

/* 使用BigInt可以正常进行加减乘除等运算，结果仍然是一个BigInt
但不能把BigInt和Number放在一起运算 */
console.log(1234567n + 3456789n);  // 4691356n
console.log(1234567n / 789n);  // 1564n
console.log(1234567n % 789n);  // 571n
console.log(1234567n + 3456789);  // Uncaught TypeError: Cannot mix BigInt and other types

// 计算圆面积:
var r = 123.456;
var s = 3.14 * r * r;
console.log(s);  // 47857.94555904001

// *字符串
// 以单引号'或双引号"括起来的任意文本

// *布尔值
true;  // 这是一个true值
false;  // 这是一个false值
2 > 1;  // 这是一个true值
2 >= 3;  // 这是一个false值

// **布尔值的运算
// && 与运算，只有所有都为true，&&运算结果才是true
true && true;  // 这个&&语句计算结果为true
true && false;  // 这个&&语句计算结果为false
false && true && false;  // 这个&&语句计算结果为false
// || 或运算，只要其中有一个为true，||运算结果就是true
false || false;  // 这个||语句计算结果为false
true || false;  // 这个||语句计算结果为true
false || true || false;  // 这个||语句计算结果为true
// ! 非运算，它是一个单目运算符，把true变成false，false变成true
! true;  // 结果为false
! false;  // 结果为true
! (2 > 5);  // 结果为true

// 在条件判断语句中使用布尔值
var age = 15;
if (age >= 18) {
    alert('adult');
} else {
    alert('teenager');
}

// *条件运算符
// 对Number做比较时，可以通过比较运算符得到一个布尔值
2 > 5;  // false
5 >= 2;  // true
7 == 7;  // true

// JavaScript允许对任意数据类型做比较
false == 0;  // true
false === 0;  // false
/* JavaScript在设计时，有两种比较运算符：
第一种是==比较，它会自动转换数据类型再比较，很多时候，会得到非常诡异的结果；
第二种是===比较，它不会自动转换数据类型，如果数据类型不一致，返回false，如果一致，再比较。
由于JavaScript这个设计缺陷，不要使用==比较，始终坚持使用===比较。
另一个例外是NaN，这个特殊的Number与所有其他值都不相等
使用isNaN函数判断NaN */
NaN === NaN;  // false
isNaN(NaN);  // true

/* 浮点数在运算过程中会产生误差，因为计算机无法精确表示无限循环小数。
要比较两个浮点数是否相等，只能计算它们之差的绝对值，看是否小于某个阈值 */
1 / 3 === (1 - 2 / 3);  // false
Math.abs(1 / 3 - (1 - 2 / 3)) < 0.0000001;  // true

// *null和undefined
/* 用null表示一个空的值，而undefined表示值未定义。
大多数情况下，我们都应该用null。
undefined仅仅在判断函数参数是否传递的情况下有用 */

// *数组
/* 数组是一组按顺序排列的集合，集合的每个值称为元素。
JavaScript的数组可以包括任意数据类型。
数组用[]表示，元素之间用,分隔 */
[1, 2, 3.14, 'Hello', null, true];

// 另一种创建数组的方法是通过Array()函数实现
// 出于代码的可读性考虑，强烈建议直接使用[]
new Array(1, 2, 3);  // 创建了数组[1, 2, 3]

// 数组的元素可以通过索引来访问
var arr = [1, 2, 3.14, 'Hello', null, true];
arr[0];  // 返回索引为0的元素，即1
arr[5];  // 返回索引为5的元素，即true
arr[6];  // 索引超出了范围，返回undefined
console.log(arr[0], arr[5], arr[6]);

// *对象
// javaScript的对象是一组由键-值组成的无序集合
// JavaScript对象的键都是字符串类型，值可以是任意数据类型
// 键又称为对象的属性，person的name属性为'Bob'，zipcode属性为null
var person = {
    name: 'Bob',
    age: 20,
    tags: ['js', 'web', 'mobile'],
    city: 'Beijing',
    hasCar: true,
    zipcode: null
};
// 要获取一个对象的属性，可以使用对象变量.属性名的方式
person.name;  // 'Bob'
person.zipcode;  // null