//JZ35 数组中的逆序对
/**
 描述
 在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组,求出这个数组中的逆序对的总数P。并将P对1000000007取模的结果输出。 即输出P%1000000007

 对于50\%50%的数据,size\leq 10^4size≤10
 4
  
 对于100\%100%的数据,size\leq 10^5size≤10
 5
 输入描述：
 题目保证输入的数组中没有的相同的数字
 示例1
 输入：
 [1,2,3,4,5,6,7,0]
 复制
 返回值：
 7
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param data int整型一维数组
     * @return int整型
     */
    func InversePairs ( _ data: [Int]) -> Int {
        // write code here
        if data.count == 0 {
            return 0
        }
        var temp = Array(repeating: 0, count: data.count)
        var data = data
        return sort(&data, 0, data.count-1,&temp,"InversePairs")
        
    }
    
    //归并排序 (分治思想)
    //排序
    func sort (_ data:inout [Int],_ l:Int,_ r:Int,_ temp: inout [Int],_ str:String)-> Int{
        print("sort:\(str),l:\(l),r:\(r)")
        if l>=r {
            return 0
        }
        let mid = l+(r-l)/2
        let lCount = sort(&data, l, mid,&temp,"lCount")
        print("lcount-----\(lCount)")
        let rCount = sort(&data, mid+1, r,&temp,"rCount")
        print("rCount-----\(rCount)")
        if data[mid]<data[mid+1]{
          return lCount+rCount
        }
        let mergeCount = merge(&data, l, r, mid,&temp)
        return lCount + rCount + mergeCount
    }
    
    //合并有序数组
    func merge(_ data:inout[Int],_ l:Int,_ r:Int,_ m:Int,_ temp:inout[Int])-> Int {
        print("data:\(data)")
        print("temp:\(temp)")
        for k in l...r{
            temp[k] = data[k]
        }
        
        
        var count = 0
        var i = l ,j = m+1
        for k in i...r {
            if i == m+1 { //说明i角标的数据已经遍历完,所以直接把j的赋值
                data[k] = temp[j]
                j += 1
            }else if j == r + 1{
                data[k] = temp[i]
                i += 1
            }else if temp[i] <= temp[j]{ //比大小,i的数据比j的小,吧i的数据赋值给data.
                data[k] = temp[i]
                i += 1
            }else{
                data[k] = temp[j]
                j += 1
                count += (m-i+1)
            }
        }
        print(data)
        return count
    }
    
}

let sol = Solution()
sol.InversePairs([1,2,3,4,5,6,7,0])
