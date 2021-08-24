//NC19 子数组的最大累加和问题
/**
 给定一个数组arr，返回子数组的最大累加和
 例如，arr = [1, -2, 3, 5, -2, 6, -1]，所有子数组中，[3, 5, -2, 6]可以累加出最大的和12，所以返回12.
 题目保证没有全为负数的数据
 [要求]
 时间复杂度为O(n)O(n)，空间复杂度为O(1)O(1)
 
 输入：
 [1, -2, 3, 5, -2, 6, -1]
 复制
 返回值：
 12

 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * max sum of the subarray
     * @param arr int整型一维数组 the array
     * @return int整型
     */
    func maxsumofSubarray ( _ arr: [Int]) -> Int {
        // write code here
        //dp[i]代表第i位的时候,以arr[i]结尾的连续子数组最大累加和
//        var dp = [Int]()
//        dp[0] = arr[0]
//        var res = arr[0]
        if arr.count==1{
            return arr.first!
        }
        if arr.count > 0 {
            var m = arr[0]
            var arr = arr
            for i in 1..<arr.count{
                arr[i] = max(arr[i], arr[i-1]+arr[i])
                m = max(m, arr[i])
            } 
            return m
        }
        return 0
    }
}


let sol = Solution()
sol.maxsumofSubarray([1, -2, 3, 5, -2, 6, -1])
