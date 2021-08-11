

/**
 05.JZ28 数组中出现次数超过一半的数字
 描述
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。例如输入一个长度为9的数组[1,2,3,2,2,2,5,4,2]。由于数字2在数组中出现了5次，超过数组长度的一半，因此输出2。你可以假设数组是非空的，并且给定的数组总是存在多数元素。1<=数组长度<=50000，0<=数组元素<=10000
 
 
 输入：
 [1,2,3,2,2,2,5,4,2]
 
 返回值：
 2
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param numbers int整型一维数组
     * @return int整型
     */
    func MoreThanHalfNum_Solution ( _ numbers: [Int]) -> Int {
        // write code here
        guard numbers.count>0 else {
            return 0
        }
        
        var count = 0
        var win = -1
        
        for i in numbers{
            //没有了
            if count == 0 {
                win = i
                count = 1
            }else {
//                //同一阵营
//                if win == i {
//                    count += 1
//                }else{
//                    count -= 1
//                }
                count += (win == i) ? 1 : -1
            }
        }
        return win
    }
}


let sol = Solution()
sol.MoreThanHalfNum_Solution([1,2,3,2,2,2,5,4,2])

