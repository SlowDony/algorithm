//41.JZ30 连续子数组的最大和
/**
 描述
 输入一个整型数组，数组里有正数也有负数。数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。要求时间复杂度为 O(n).
 
 输入：
 [1,-2,3,10,-4,7,2,-5]
 复制
 返回值：
 18
 复制
 说明：
 输入的数组为{1,-2,3,10,—4,7,2,一5}，和最大的子数组为{3,10,一4,7,2}，因此输出为该子数组的和 18。
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param array int整型一维数组
     * @return int整型
     */
    func FindGreatestSumOfSubArray ( _ array: [Int]) -> Int {
        // write code here
        var array = array
        
        var maxNum = array[0]
        var i = 1
        for _ in 1..<array.count {
             array[i] += (array[i-1]<0 ? 0 : array[i-1])
             maxNum = max(array[i], maxNum)
             i += 1
        }
        return maxNum
    }
}
