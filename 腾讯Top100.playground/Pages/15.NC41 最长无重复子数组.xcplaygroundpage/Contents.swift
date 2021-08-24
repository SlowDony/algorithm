import Foundation

//NC41 最长无重复子数组
/**
 给定一个数组arr，返回arr的最长无重复元素子数组的长度，无重复指的是所有数字都不相同。
 子数组是连续的，比如[1,3,5,7,9]的子数组有[1,3]，[3,5,7]等等，但是[1,3,7]不是子数组
 
 输入：
 [2,3,4,5]
 复制
 返回值：
 4
 复制
 说明：
 [2,3,4,5]是最长子数组
 */

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param arr int整型一维数组 the array
     * @return int整型
     */
    func maxLength ( _ arr: [Int]) -> Int {
        // write code here
        //保存子数组
        var list = [Int]()
        var m = 0
        for sub in arr {
            m = max(m, list.count)
            if let index = list.firstIndex(of: sub){
                list.removeSubrange(Range.init(NSRange.init(location: 0, length: index+1))!)
            }
            list.append(sub)
        }
        return max(m, list.count)
    }
}

let soul = Solution()
soul.maxLength([2,2,3,4,8,99,3])
