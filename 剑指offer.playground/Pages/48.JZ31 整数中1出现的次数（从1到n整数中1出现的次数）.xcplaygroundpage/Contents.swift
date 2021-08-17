
//JZ31 整数中1出现的次数（从1到n整数中1出现的次数）
/**
 描述
 输入一个整数 n ，求1～n这n个整数的十进制表示中1出现的次数
 例如，1~13中包含1的数字有1、10、11、12、13因此共出现6次

 示例1
 输入：
 13
 复制
 返回值：
 6
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @return int整型
     */
    func NumberOf1Between1AndN_Solution ( _ n: Int) -> Int {
        // write code here
        var base = 1
        var res = 0
        
        while base<=n {
            var a = n/base
            let b = n%base
            let cur = a%10
            a = a/10
            if cur>1 {
                res += (a+1)*base
            }else if cur == 1 {
                res += a*base+b+1
            }else {
                res += a*base
            }
            base *= 10
        }
        return res
    }
}

let sol = Solution()
sol.NumberOf1Between1AndN_Solution(10)
