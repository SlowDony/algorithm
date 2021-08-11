//JZ13 调整数组顺序使奇数位于偶数前面
/**
 描述
 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有的奇数位于数组的前半部分，所有的偶数位于数组的后半部分，并保证奇数和奇数，偶数和偶数之间的相对位置不变。
 */

/**
 输入：
 [1,2,3,4]
 复制
 返回值：
 [1,3,2,4]

 输入：
 [2,4,6,5,7]
 返回值：
 [5,7,2,4,6]

 
 */
import Foundation

public class Solution {
    
    public func reOrderArray(_ arr :[Int]) -> [Int]{
        guard arr.count>0 else {
            return []
        }
        
        var start = 0
        var array = Array.init(repeating: 0, count: arr.count)
        for i in 0..<array.count {
            if arr[i] % 2 != 0 {
                array[start] = arr[i]
                start += 1
            }
        }
        
        for j in 0..<array.count {
            if arr[j] % 2 == 0
            {
                array[start] = arr[j]
                start += 1
            }
        }
        
        
        return array
        
    }
    
    ///两头查找
    public func reOrderArray1(_ arr :[Int]) -> [Int]{
        guard arr.count>0 else {
            return []
        }
        
        var start = 0 , end = arr.count-1
        var arr = arr
        while start < end  {
            while start < end && arr[start]%2 != 0 {
                start += 1
            }
            while start < end && arr[end] % 2 == 0{
                end -= 1
            }
            if start < end {
                let temp = arr[start]
                arr[start] = arr[end]
                arr[end] = temp
            }
        }
        return arr
        
    }
}


let sol = Solution()
sol.reOrderArray([1,2,3,4,5,6,7])



