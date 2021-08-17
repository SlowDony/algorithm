//JZ40 数组中只出现一次的两个数字
/**
 一个整型数组里除了两个数字只出现一次，其他的数字都出现了两次。请写程序找出这两个只出现一次的数字。
 示例1
 输入：
 [1,4,1,6]
 复制
 返回值：
 [4,6]
 复制
 说明：
 返回的结果中较小的数排在前面
 */
import Foundation
class Solution {
    /**
    * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
    *
    *
        * @param array int整型一维数组
        * @return int整型一维数组
    */
    func FindNumsAppearOnce(arr:[Int]) -> [Int] {
        if arr.count == 0 {
            return []
        }
        var hashmap = [Int:Int]()
        for i in arr {
            if hashmap.keys.contains(i){
                hashmap[i]! += 1
            }else{
                hashmap[i] = 1
            }
        }
        var res = [Int]()
        print(hashmap)
        for (key ,value) in hashmap {
            if value == 1 {
                res.append(key)
            }
        }
        
        if res[0] > res[1]{
            return [res[1],res[0]]
        }
        return res
    }
    
}

let sol = Solution()
sol.FindNumsAppearOnce(arr: [1,4,1,6])
