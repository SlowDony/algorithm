
//50.Pow(x,n)
/**
 实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。

  

 示例 1：

 输入：x = 2.00000, n = 10
 输出：1024.00000
 示例 2：

 输入：x = 2.10000, n = 3
 输出：9.26100
 示例 3：

 输入：x = 2.00000, n = -2
 输出：0.25000
 解释：2-2 = 1/22 = 1/4 = 0.25

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/powx-n
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    //位与算
    func myPow(_ x: Double, _ n: Int) -> Double {
        
        var x = x , n = n
        //n 小于 0 转换
        if n<0{
            x = 1/x
            n = -n
        }
        var res = 1.0
        while n>0 {
            // 等价于 n % 2 相当于 n为基数时需要多乘以一个x
            if n & 1 == 1 {
                res *= x
            }
            //相当于x平方
            x *= x
            print(x)
            // 等价于 n/2
             n = n/2 
        }
        return res
        
    }
    //递归
    func myPow1(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if n < 0 {
            return  1 / myPow(x,-n)
        }
        if n % 2 == 0 {
            return x * myPow(x,n-1)
        }
        return myPow(x*x,n/2)
    }
}

let rol = Solution()
rol.myPow(2,4)
