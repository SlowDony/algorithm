//25.JZ21 栈的压入、弹出序列
/**
 输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否可能为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如序列1,2,3,4,5是某栈的压入顺序，序列4,5,3,2,1是该压栈序列对应的一个弹出序列，但4,3,5,1,2就不可能是该压栈序列的弹出序列。（注意：这两个序列的长度是相等的）
 
 输入：
 [1,2,3,4,5],[4,3,5,1,2]
 复制
 返回值：
 false
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pushV int整型一维数组
     * @param popV int整型一维数组
     * @return bool布尔型
     */
    func IsPopOrder ( _ pushV: [Int],  _ popV: [Int]) -> Bool {
        // write code here
        let count = pushV.count
        var stack = [Int]()
        var i = 0
        for v in pushV {
            stack.append(v)
            while stack.isEmpty == false && i<count && stack.last == popV[i]   {
                stack.popLast()
                i += 1
            }
        }
        return i == count
    }
}
