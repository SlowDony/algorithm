//JZ34 第一个只出现一次的字符
/**
 
 描述
 在一个字符串(0<=字符串长度<=10000，全部由字母组成)中找到第一个只出现一次的字符,并返回它的位置, 如果没有则返回 -1（需要区分大小写）.（从0开始计数）
 
 输入：
 "google"
 复制
 返回值：
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串
     * @return int整型
     */
    func FirstNotRepeatingChar ( _ str: String) -> Int {
        // write code here
        var map = [Character:Int]()
        
        for i in str {
            if let a = map[i] {
                map[i] = a + 1
            }else{
                map[i] = 0
            }
        }
        
        var index = 0
        for i in str {
            if let v =  map[i]  {
                if v == 0 {
                    return index
                }
            }
            index += 1
        }
        return -1
    }
}

let sol = Solution()
sol.FirstNotRepeatingChar("abca")
