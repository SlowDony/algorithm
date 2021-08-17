
//50.JZ33 丑数
/**
 描述
 把只包含质因子2、3和5的数称作丑数（Ugly Number）。例如6、8都是丑数，但14不是，因为它包含质因子7。 习惯上我们把1当做是第一个丑数。求按从小到大的顺序的第N个丑数。
 
 输入：
 7
 复制
 返回值：
 8
 */
import Foundation
//1,2,3,4,5,6,8,9,10,
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param index int整型
     * @return int整型
     */
    func GetUglyNumber_Solution ( _ index: Int) -> Int {
        // write code here
        
        if index == 0 {
            return index
        }
        var res = Array(repeating: 0, count: index)
        res[0] = 1
        
        ///初始化
        var p2 = 0 ,p3 = 0 , p5 = 0
        
        for i in 1..<res.count {
            
            res[i] = min(res[p2]*2, min(res[p3]*3, res[p5]*5))
          
            if res[i] == res[p2]*2 { p2 += 1 }
            if res[i] == res[p3]*3 { p3 += 1 }
            if res[i] == res[p5]*5 { p5 += 1 }
            
        }
        return res.last!
    }
}

let sol = Solution()
sol.GetUglyNumber_Solution(11)



