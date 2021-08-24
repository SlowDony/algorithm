public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @return int整型
     */
    func Fibonacci ( _ n: Int) -> Int {
        // write code here
        /**
         n=0 -> 0
         n=1->1
         n=2 ->1
         n=3 ->2
         ...
         */
        guard n > 1 else {
           return n
        }
        
        var first = 0
        var second = 1
        var sum = 0
        
        for _ in 2...n {
            sum = first+second
            first = second
            second = sum
        }
        return sum
    }
}


let solution = Solution()
solution.Fibonacci(19)
