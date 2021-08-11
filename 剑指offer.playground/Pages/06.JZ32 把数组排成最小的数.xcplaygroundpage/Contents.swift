//06.JZ32 把数组排成最小的数
/**
 
 输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。例如输入数组{3，32，321}，则打印出这三个数字能排成的最小数字为321323。

 输入：
 [3,32,321]
 
 返回值：
 "321323"

 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param numbers int整型一维数组
     * @return string字符串
     */
    func PrintMinNumber ( _ numbers: [Int]) -> String {
        // write code here
        
        var nums = numbers.compactMap{"\($0)"}
        
        nums.sort{($0+$1) > ($1+$0)}
        
        return nums.joined()
        
    }
}
