
import Foundation

//12.NC68 跳台阶
/**
 描述
 一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param number int整型
     * @return int整型
     */
    func jumpFloor ( _ number: Int) -> Int {
        // write code here
        // f(n) = f(n-1) + f(n-2)
        guard number > 1 else {
            return number
        }

        var a = 1 , b = 1 , c = 0
        for _ in 2...number {
            c = a + b
            a = b
            b = c
        }
        return c
    }
}


let sol = Solution()
sol.jumpFloor(7)
