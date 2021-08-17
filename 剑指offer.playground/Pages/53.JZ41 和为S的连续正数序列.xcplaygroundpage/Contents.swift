//JZ41 和为S的连续正数序列
/**
 描述
 小明很喜欢数学,有一天他在做数学作业时,要求计算出9~16的和,他马上就写出了正确答案是100。但是他并不满足于此,他在想究竟有多少种连续的正数序列的和为100(至少包括两个数)。没多久,他就得到另一组连续正数和为100的序列:18,19,20,21,22。现在把问题交给你,你能不能也很快的找出所有和为S的连续正数序列? Good Luck!
 返回值描述：
 输出所有和为S的连续正数序列。序列内按照从小至大的顺序，序列间按照开始数字从小到大的顺序
 示例1
 输入：
 9
 复制
 返回值：
 [[2,3,4],[4,5]]
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param sum int整型
     * @return int整型二维数组
     */
    func FindContinuousSequence ( _ sum: Int) -> [[Int]] {
        // write code here
        var left = 1 ,right = 1
        var res = 0 //计算和
        var arr = [[Int]]()
        while left <= sum/2 {
            if res < sum {
                res += right
                right += 1
            }else if res > sum {
                res -= left
                left += 1
            }else{ //等于
                
                var temp = [Int]()
                for i in left...right {
                    temp.append(i)
                }
                arr.append(temp)
                res -= left
                left += 1
            }
        }
        return arr
    }
}

let sol = Solution()
sol.FindContinuousSequence(9)
