
import Foundation

//NC61 两数之和
/**
 描述
 给出一个整数数组，请在数组中找出两个加起来等于目标值的数，
 你给出的函数twoSum 需要返回这两个数字的下标（index1，index2），需要满足 index1 小于index2.。注意：下标是从1开始的
 假设给出的数组中只存在唯一解
 例如：
 给出的数组为 {20, 70, 110, 150},目标值为90
 输出 index1=1, index2=2


 示例1
 输入：
 [3,2,4],6
 复制
 返回值：
 [2,3]
 复制
 说明：
 因为 2+4=6 ，而 2的下标为2 ， 4的下标为3 ，又因为 下标2 < 下标3 ，所以输出[2,3] 
 */
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
//            print(dict)
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


