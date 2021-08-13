//JZ45 扑克牌顺子
/**
 描述
 现在有2副扑克牌，从扑克牌中随机五张扑克牌，我们需要来判断一下是不是顺子。
 有如下规则：
 1. A为1，J为11，Q为12，K为13，A不能视为14
 2. 大、小王为 0，0可以看作任意牌
 3. 如果给出的五张牌能组成顺子（即这五张牌是连续的）就输出true，否则就输出false。
 例如：给出数据[6,0,2,0,4]
 中间的两个0一个看作3，一个看作5 。即：[6,3,2,5,4]
 这样这五张牌在[2,6]区间连续，输出true
 数据保证每组5个数字，每组最多含有4个零，数组的数取值为 [0, 13]
 
 输入：
 [6,0,2,0,4]
 复制
 返回值：
 true
 
 // 思路
 假设如果没有0
 最大值-最小值大于4
 
 */

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param numbers int整型一维数组
     * @return bool布尔型
     */
    func IsContinuous ( _ numbers: [Int]) -> Bool {
        // write code here
        
        var set = Set<Int>()
        var maxNum = 0, minNum = 14
        for num in numbers {
            if num > 0 {
                if set.contains(num){return false}
                set.insert(num)
                maxNum = max(maxNum, num)
                minNum = min(minNum, num)
            }
        }
        
        return maxNum-minNum<5
        
    }
}
