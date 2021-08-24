/**
 242. 有效的字母异位词
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。

  

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-anagram
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {return false}
        var sMap = mapCount(s: s)
        var tMap = mapCount(s: t)
        return sMap == tMap
    }
    
    func mapCount(s:String) -> [Character:Int] {
        var res = [Character:Int]()
        for c in s {
            res[c] = res.keys.contains(c) ? (res[c]!+1) : 1
        }
        return res
    }
}

let sol = Solution ()
sol.isAnagram("aab", "bab")
