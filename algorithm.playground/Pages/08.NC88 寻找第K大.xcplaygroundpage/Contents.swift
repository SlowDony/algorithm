
import Foundation

//08.NC88 寻找第K大

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param a int整型一维数组
     * @param n int整型
     * @param K int整型
     * @return int整型
     */
    func findKth ( _ a: [Int],  _ n: Int,  _ K: Int) -> Int {
        // write code here
        if  K == 0 || K > n {
            return 0
        }
        var a = a
        let num = findK(&a, 0, n-1, K)
        print(a)
        return num
    }
    
    func findK(_ arr:inout [Int] ,_ left:Int,_ right:Int,_ k:Int) -> Int{
        print("findK")
        if left <= right {
            let pivot = partition(&arr, left, right)
            if pivot == k-1 {
                return arr[pivot]
            }else if pivot < (k-1){
                return findK(&arr, pivot+1, right, k)
            }else {
                return findK(&arr, left, pivot-1, k)
            }
        }
        return -1
    }
    
    
    ///
    /// - Parameters:
    ///   - a: 数组
    ///   - left: 最左边
    ///   - right: 最右边
    func partition(_ a:inout [Int],_ left: Int,_ right: Int) -> Int{
        let pivot = a[left] //参考基准
        var start = left ,  end = right
        while start < end {
            while (start<end && a[end]<=pivot){
                end -= 1
            }
            a.swapAt(start, end)
            while (start<end && a[start]>=pivot) {
                start += 1
            }
            a.swapAt(start, end)
        }
        return start
    }
    
    
    /// 函数
    /// - Parameter a: 数组
    /// - Returns: 返回
    func funcSort(_ a:[Int]) -> [Int]{
        let arr = a.sorted{$0>$1}
        print(arr)
        return arr
    }
    
}

let sol = Solution()
sol.findKth([1,3,2,0,3,1,2,3], 8, 7)
