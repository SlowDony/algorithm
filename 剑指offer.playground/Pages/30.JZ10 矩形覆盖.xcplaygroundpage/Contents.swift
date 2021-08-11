//30.JZ10 矩形覆盖
/**
 我们可以用2*1的小矩形横着或者竖着去覆盖更大的矩形。请问用n个2*1的小矩形无重叠地覆盖一个2*n的大矩形，从同一个方向看总共有多少种不同的方法？

 比如n=3时，2*3的矩形块有3种不同的覆盖方法(从同一个方向看)：
 输入描述：
 2*1的小矩形的总个数n
 返回值描述：
 覆盖一个2*n的大矩形总共有多少种不同的方法(从同一个方向看)
 
 输入：
 0
 复制
 返回值：
 0
 
 思路:
 f(1) = 1
 f(2) = 2
 f(3) = 3
 f(4) = 5
 f(n) = f(n-1)+f(n-2)
 */

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param number int整型
     * @return int整型
     */
    func rectCover ( _ number: Int) -> Int {
        // write code here
        guard number>3 else {
            return number
        }
        var a = 1
        var b = 2
        var res = Int()
        for _ in 3...number {
            res = a + b
            a = b
            b = res
        }
        return res
    }
}

let sol = Solution()
sol.rectCover(3)
