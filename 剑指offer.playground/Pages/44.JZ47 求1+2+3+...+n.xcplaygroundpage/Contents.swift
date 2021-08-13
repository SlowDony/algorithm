//44.JZ47 求1+2+3+...+n
/**
 描述
 求1+2+3+...+n，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
 
 输入：
 5
 复制
 返回值：
 15
 
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @return int整型
     */
    func Sum_Solution ( _ n: Int) -> Int {
        // write code here
        var  sum = n
        n>0 && {sum += Sum_Solution(n-1);return true}()
        return sum
    }
}
