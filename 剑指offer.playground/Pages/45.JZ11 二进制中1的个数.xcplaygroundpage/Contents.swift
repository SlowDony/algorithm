//45.JZ11 二进制中1的个数
/**
 描述
 输入一个整数，输出该数32位二进制表示中1的个数。其中负数用补码表示。
 
 示例1
 输入：
 10
 复制
 返回值：
 2
 
 1 & 1 = 1
 0 & 1 = 0
 即n&1 = 1 说明最后数字为1 , n&1 = 0 说明最后数字为0
 或者
 (n-1)&n = 1说明最后数字为1 
 
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @return int整型
     */
    
    func NumberOf2  (_ n: Int) -> Int {
        var num = n
        var count = 0
        for _ in 0..<32{
            count += (num & 1) //与x&1 == 1 说明末尾为1相加
            num >>= 1 //左移一位
        }
        return count
    }
    
    func NumberOf1 ( _ n: Int) -> Int {
        var result = 0
        var sn = n
        while sn > 0 {
            result += sn & 1 == 0 ? 0 : 1
            sn >>= 1
        }
        return result
    }
}

let sol = Solution()
sol.NumberOf1(-2147483648)


