
//JZ42 和为S的两个数字
/**
 
 描述
 输入一个递增排序的数组和一个数字S，在数组中查找两个数，使得他们的和正好是S，如果有多对数字的和等于S，返回两个数的乘积最小的，如果无法找出这样的数字，返回一个空数组即可。
 返回值描述：
 对应每个测试案例，输出两个数，小的先输出。
 
 输入：
 [1,2,4,7,11,15],15
 
 返回值：
 [4,11]

 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param array int整型一维数组
     * @param sum int整型
     * @return int整型一维数组
     */
    func FindNumbersWithSum ( _ array: [Int],  _ sum: Int) -> [Int] {
        // write code here
        guard array.count>2 else {
            return []
        }
        
        var start = 0 ,end = array.count-1
        while start<end {
            if array[start] + array[end] == sum {
                return [array[start],array[end]]
            }else if array[start] + array[end] > sum
            {
                end -= 1
            }else{
                start += 1
            }
        }
        
        return []
        
    }
}


