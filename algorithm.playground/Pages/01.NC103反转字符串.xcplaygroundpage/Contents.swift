public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 反转字符串
     * @param str string字符串
     * @return string字符串
     */
    func solve ( _ str: String) -> String {
        // write code here
        var solveStr  = ""
        for string in str.reversed(){
            solveStr.append(string)
        }
        return solveStr
    }
}

let sol = Solution()
sol.solve("asf")
