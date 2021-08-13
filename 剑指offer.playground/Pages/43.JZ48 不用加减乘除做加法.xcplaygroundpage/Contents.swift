//JZ48 不用加减乘除做加法
/**
 描述
 写一个函数，求两个整数之和，要求在函数体内不得使用+、-、*、/四则运算符号。
 示例1
 输入：
 1,2
 复制
 返回值：
 3
 
 a(i)    b(i)b(i)    无进位和 n(i)n(i)    进位 c(i+1)c(i+1)
 0    0    0    0
 0    1    1    0
 1    0    1    0
 1    1    0    1

 无进位和 和异或运算相同
 进位和与运算相同(需要左移一位)
 n=a⊕b 非进位和：异或运算
 c=a&b<<1 进位：与运算+左移一位
 因此 s = a+b 相当于 s = n + c
 
 */

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num1 int整型
     * @param num2 int整型
     * @return int整型
     */
    func Add ( _ num1: Int,  _ num2: Int) -> Int {
        // write code here
        var num1 = num1 ,num2 = num2
        while num2 != 0{ //当进位为 0 时跳出
            let temp = num1^num2 //无进位和
            num2 = (num1&num2)<<1 //进位
            num1 = temp
        }
        return num1
    }
}


