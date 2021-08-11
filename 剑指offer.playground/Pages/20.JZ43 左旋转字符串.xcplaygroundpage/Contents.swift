//20.JZ43 左旋转字符串
/**
 描述
 汇编语言中有一种移位指令叫做循环左移（ROL），现在有个简单的任务，就是用字符串模拟这个指令的运算结果。对于一个给定的字符序列 S，请你把其循环左移 K 位后的序列输出（保证 K 小于等于 S 的长度）。例如，字符序列S=”abcXYZdef”,要求输出循环左移 3 位后的结果，即“XYZdefabc”。是不是很简单？OK，搞定它！
 
 输入：
 "abcXYZdef",3
 
 返回值：
 "XYZdefabc"
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串
     * @param n int整型
     * @return string字符串
     */
    func LeftRotateString ( _ str: String,  _ n: Int) -> String {
        // write code here
        
        if str.isEmpty == false && n <= str.count {
            
            var result = String()
            let strArr = Array(str)
            for s in n..<(str.count-1){
                result.append(strArr[s])
            }
            for s in 0..<n {
                result.append(strArr[s])
            }
            return result
        }
        
        return str
    }
}
 

let sol = Solution()
sol.LeftRotateString("", 6)

