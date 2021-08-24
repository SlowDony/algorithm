import Foundation

/**
 JZ50 数组中重复的数字
 在一个长度为n的数组里的所有数字都在0到n-1的范围内。 数组中某些数字是重复的，但不知道有几个数字是重复的。也不知道每个数字重复几次。请找出数组中任一一个重复的数字。 例如，如果输入长度为7的数组[2,3,1,0,2,5,3]，那么对应的输出是2或者3。存在不合法的输入的话输出-1
 
 输入[2,3,1,0,2,5,3]
 输出:2或3
 
 
 */
import Foundation

 public class Solution {
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
            var map = [Int:Int]()
            for n in nums {
                if map.keys.contains(n){
                    map[n]! += 1
                }else{
                    map[n] = 1
                }
            }
            for n in nums {
                if map[n]! > 1 {
                    return true
                }
            }
            return false
        }
 
    ///二分法查找
    func findRepeatNumber1(_ nums: [Int]) -> Int? {
        // 所有数字都在1到 nums.count-1 大小范围内， min 和 max 表示这个范围
        var start = 1
        var end = nums.count - 1
        let min = start
        while start <= end {
            let middle = (end - start) / 2 + min
            let countAtRange = nums.filter { $0 >= start && $0 <= middle }.count
            
            //退出条件
            if start == end {
                if countAtRange > 1 {
                    return start
                } else {
                    break
                }
            }
            
            //范围缩小
            if countAtRange > (middle - start + 1) {
                end = middle
            } else {
                start = middle + 1
            }
        }
        return -1
    }
//    {
//        guard nums.count>0 else {
//            return -1
//        }
//
//        var start = 1
//        var end = nums.count - 1
//
//        while start <= end {
//            let middle = (end-start)/2+1
//            let rangecount = nums.filter { $0 >= start && $0 <= middle }.count
//            print(rangecount)
//            if start == end {
//                if rangecount > 1 {
//                    return start
//                }else {
//                    break
//                }
//            }
//
//            ///范围缩小
//            if rangecount > (middle-start+1){
//                end = middle
//            }else{
//                start = middle+1
//            }
//        }
//
//
//        return -1
//    }
    
    ///原地交换
    func findRepeatNumber(_ nums:[Int]) -> Int {
        guard nums.count>0 else {
            return -1
        }
        
        var nums = nums
        for i in 0..<nums.count {
            while i != nums[i] {
                if nums[i] == nums[nums[i]] {
                    return nums[i]
                }
                nums.swapAt(i, nums[i])
                print(nums)
            }
        }
        return -1
    }
 }

let sol = Solution()
print(sol.findRepeatNumber([2,3,1,0,2,5,3]))
