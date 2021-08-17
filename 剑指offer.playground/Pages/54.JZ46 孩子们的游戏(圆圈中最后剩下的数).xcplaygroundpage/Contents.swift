//JZ46 孩子们的游戏(圆圈中最后剩下的数)
/**
 描述
 每年六一儿童节,牛客都会准备一些小礼物去看望孤儿院的小朋友,今年亦是如此。HF作为牛客的资深元老,自然也准备了一些小游戏。其中,有个游戏是这样的:首先,让小朋友们围成一个大圈。然后,他随机指定一个数m,让编号为0的小朋友开始报数。每次喊到m-1的那个小朋友要出列唱首歌,然后可以在礼品箱中任意的挑选礼物,并且不再回到圈中,从他的下一个小朋友开始,继续0...m-1报数....这样下去....直到剩下最后一个小朋友,可以不用表演,并且拿到牛客名贵的“名侦探柯南”典藏版(名额有限哦!!^_^)。请你试着想下,哪个小朋友会得到这份礼品呢？(注：小朋友的编号是从0到n-1)

 如果没有小朋友，请返回-1
 示例1
 输入：
 5,3
 复制
 返回值：
 3
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @param m int整型
     * @return int整型
     */
    
    //链表
    func LastRemaining_Solution ( _ n: Int,  _ m: Int) -> Int {
        // write code here
        var n = n
        if n == 0 {
            return -1
        }
        var arr = Array(0..<n)
        var res = 0
       
        
        while n>1 {
            res = (res+m-1)%n
            arr.remove(at: res)
            n -= 1
        }
        return arr.first!
    }
    //数学解决
    func LastRemaining_Solution1 ( _ n: Int,  _ m: Int) -> Int {
        // write code here
        if n == 0 {
            return -1
        }
        var x = 0
        for i in 2...n {
            x = (x+m)%i
        }
        return x
    }
}

let sol = Solution()
sol.LastRemaining_Solution(5, 3)
