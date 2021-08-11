import UIKit
//JZ6 旋转数组的最小数字

/**
 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
 输入一个非递减排序的数组的一个旋转，输出旋转数组的最小元素。
 NOTE：给出的所有元素都大于0，若数组大小为0，请返回0。
 
 输入：
 [3,4,5,1,2]
 
 返回值：
 1
 */

/**
 
 思路:二分法求解
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param rotateArray int整型一维数组
     * @return int整型
     */
    
    /// 二分法求解
    func minNumberInRotateArray ( _ rotateArray: [Int]) -> Int {
        // write code here
        guard rotateArray.count>0 else {
            return -1
        }
        var min = 0, max = rotateArray.count-1
        while min<max {
            let mid = (max-min)/2
            if rotateArray[mid] < rotateArray[max] {
                min = mid+1
            }else if rotateArray[mid] > rotateArray[max] {
                max = mid
            }else {
                max-=1
            }
        }
        return rotateArray[min]
    }
    
    /// 排序求解
    func minNumberInRotateArray1 ( _ rotateArray: [Int]) -> Int {
        // write code here
        guard rotateArray.count>0 else {
            return -1
        }
        
        let arr = rotateArray.sorted()
        return arr.first!
    }
}
