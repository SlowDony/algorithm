//JZ37 数字在升序数组中出现的次数
import Foundation
/**
 描述
 统计一个数字在升序数组中出现的次数。
 
 输入：
 [1,2,3,3,3,3,4,5],3
 
 返回值：
 4

 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param data int整型一维数组
     * @param k int整型
     * @return int整型
     */
    
    ///二分法求解
    func GetNumberOfK ( _ data: [Int],  _ k: Int) -> Int {
        guard data.count > 0  else { return 0 }
        var lbound = 0,rbound = 0
        
        //寻找上界
        var start = 0 ,end = data.count-1
        while start < end {
            let mid = start + (end-start) / 2
            if data[mid] < k {
                start = mid+1
            }else{
                end = mid
            }
        }
        
        lbound = start
        //寻找下界
        start = 0
        end = data.count - 1
        while start < end {
            let mid = start + (end-start)/2
            if data[mid] <= k {
                start = mid + 1
            }else {
                end = mid
            }
        }
        rbound = end
        
        return rbound - lbound
    }
    
    ///暴力解法
    func GetNumberOfK1 ( _ data: [Int],  _ k: Int) -> Int {
        // write code here
        
        guard data.count > 0 else {
            return 0
        }
        
        var count = 0
        for i in data {
            if i == k {
                count+=1
            }else if i > k {
                break
            }
        }
        return count
        
    }
}
