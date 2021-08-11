
import Foundation

//NC61 两数之和
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param numbers int整型一维数组
     * @param target int整型
     * @return int整型一维数组
     */
    func twoSum ( _ numbers: [Int],  _ target: Int) -> [Int] {
        // write code here
        var dict = [Int:Int]()
        for (index,n) in numbers.enumerated(){
            let i = index+1 //下标是从1开始的
            let second = target-n
            if let first = dict[second] {
                return [first,i]
            }
            dict[n] = i
            print(dict)
        }
        return [Int]()
    }
}

let sol =  Solution()
 print(sol.twoSum([1,0,1,-1,2,5,6,7,8], 3))

//[1: 1]
//[0: 2, 1: 1]
//[0: 2, 1: 3]
//[0: 2, -1: 4, 1: 3]
//[3, 5]


