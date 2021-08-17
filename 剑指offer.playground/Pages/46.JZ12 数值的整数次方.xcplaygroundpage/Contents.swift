//46.JZ12 数值的整数次方
/**
 
 描述
 给定一个double类型的浮点数base和int类型的整数exponent。求base的exponent次方。

 保证base和exponent不同时为0。不得使用库函数，同时不需要考虑大数问题，也不用考虑小数点后面0的位数。

 示例1
 输入：
 2.00000,3
 复制
 返回值：
 8.00000
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param base double浮点型
     * @param exponent int整型
     * @return double浮点型
     */
//    2 3
    func Power ( _ base: Double,  _ exponent: Int) -> Double {
        // write code here
        if base == 0 {
            return 0
        }
        var base = base //2
        var b = exponent //3
        var res = 1.0
        
        if b < 0 {
            base = 1/base
            b = -b
        }
        
        while b > 0 {
            if b & 1 == 1 {
                res *= base
            }
            base *= base
            b >>= 1
            print(b)
        }
        
        
        return res
    }
}

let sol = Solution()
sol.Power(2, 3)
