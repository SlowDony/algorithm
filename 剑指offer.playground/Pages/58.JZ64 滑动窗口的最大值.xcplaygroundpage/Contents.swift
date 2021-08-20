//58.JZ64 滑动窗口的最大值
/**
 给定一个数组和滑动窗口的大小，找出所有滑动窗口里数值的最大值。

 例如，如果输入数组{2,3,4,2,6,2,5,1}及滑动窗口的大小3，那么一共存在6个滑动窗口，他们的最大值分别为{4,4,6,6,6,5}； 针对数组{2,3,4,2,6,2,5,1}的滑动窗口有以下6个： {[2,3,4],2,6,2,5,1}， {2,[3,4,2],6,2,5,1}， {2,3,[4,2,6],2,5,1}， {2,3,4,[2,6,2],5,1}， {2,3,4,2,[6,2,5],1}， {2,3,4,2,6,[2,5,1]}。

 窗口大于数组长度的时候，返回空
 示例1
 输入：
 [2,3,4,2,6,2,5,1],3
 复制
 返回值：
 [4,4,6,6,6,5]
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @param size int整型
     * @return int整型一维数组
     */
    
    func maxInWindows ( _ num: [Int],  _ size: Int) -> [Int] {
        // write code here
        //值
        var res = [Int]()
        //窗口数据的索引值
        var window = [Int]()
        if num.count == 0 || size == 0 {
            return []
        }
        if size == 1 {
            return num
        }
        for (i,n) in num.enumerated() {
            //滑动window.移动到最右边的时候
            if i>=size && window[0]<=(i-size){
                //滑动到下一个位置的时候,移除最左边的,保持window长度不变
                window.removeFirst()
            }
            //移除window里所有比n小的数
            while window.count>0 && num[window.last!]<=n {
                window.removeLast()
            }
            //像window里添加元素
            window.append(i)
            print(window)
            //如果i大于
            if i >= (size-1){
                res.append(num[window.first!])
            }
        }
        return res
    }
}


let sol = Solution()
sol.maxInWindows([1,3,-1,-3,5,3,6,7], 3)

