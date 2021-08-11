import UIKit

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param input int整型一维数组
     * @param k int整型
     * @return int整型一维数组
     */
    func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
        // write code here
        if k == 0 || k > input.count{
            return []
        }
        
        var numbers = input
        numbers = input.sorted{$1>$0}
        var outputs = [Int]()
        for i in 0..<k {
            outputs.append(numbers[i])
        }
        return outputs
    }
    
    ///利用函数排序
    func funsSort(_ input:[Int]?) -> [Int]{
        
        guard input != nil else {
            return []
        }
        let output = input?.sorted{$1>$0} ?? [Int]()
        return output
        
    }
     
    /// 快排
    /// - Parameter input: 输入数据
    /// - Returns: 返回值
    func quickSort(_ input:[Int]?) -> [Int] {
        guard input != nil else {
            return []
        }
        
        
        return []
    }
}

