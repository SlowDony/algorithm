//15. 三数之和
/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 示例 2：

 输入：nums = []
 输出：[]
 示例 3：

 输入：nums = [0]
 输出：[]
  

 提示：

 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 */
import Foundation

class Solution {
    //排序加双指针
    func threeSum(_ nums: [Int]) -> [[Int]] {
//        [-2,0,1,1,2]
        if nums.count<3 {
            return []
        }
        let nums = nums.sorted()
        var res = [[Int]]()
        for i in 0..<nums.count-2{
            //因为排序好后从小到大排列,最小的数都大于0,和肯定大于0,直接跳出循环
            if nums[i]>0{break}
            //如果相邻两数相同直接进行下次循环,避免重复计算
            if i>0 && nums[i] == nums[i-1]{continue}
            
            var j = i + 1 , k = nums.count-1
            while j<k {
                let sum = nums[i] + nums[j] + nums[k]
                if sum < 0  {
                    /**
                     repeat {
                            func(1)
                     }
                     while (条件)
                     在执行判断条件时,会先执行func一次,如果满足继续执行
                     */
                    repeat {
                        j += 1
                    }
                    while j<k && nums[j] == nums[j-1]
                }else if sum > 0 {
                    repeat {
                        k -= 1
                    }
                    while j<k && nums[k] == nums[k+1]
                }else{
                    res.append([nums[i],nums[j],nums[k]])
                    
                    repeat{
                        j += 1
                    }
                    while j<k && nums[j] == nums[j-1]
                        
                    repeat{
                        k -= 1
                    }
                    while j<k && nums[k] == nums[k+1]
                }
            }
        }
        
        return res
    }
}
