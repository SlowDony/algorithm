//JZ27 字符串的排列
/**
 
 描述
 输入一个字符串，打印出该字符串中字符的所有排列，你可以以任意顺序返回这个字符串数组。例如输入字符串abc,则按字典序打印出由字符a,b,c所能排列出来的所有字符串abc,acb,bac,bca,cab和cba。
 输入描述：
 输入一个字符串,长度不超过9(可能有字符重复),字符只包括大小写字母。
 
 输入：
 "ab"
 复制
 返回值：
 ["ab","ba"]
 复制
 说明：
 返回["ba","ab"]也是正确的
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串
     * @return string字符串一维数组
     */
    
    func perm(pos:Int,s:inout[Character],ret:inout Set<String>){
        if pos+1 == s.count {
            ret.insert(String(s))
            return
        }
        
        for i in pos..<s.count {
            
            s.swapAt(pos, i)
            perm(pos: pos+1, s: &s, ret: &ret)
            s.swapAt(pos, i)
        }
    }
    
    func Permutation ( _ str: String) -> [String] {
        // write code here
        guard str.isEmpty == false else {
            return []
        }
        
        var arr = Array(str)
        var set = Set<String>()
        perm(pos: 0, s: &arr, ret: &set)
        print(set)
        
        return set.map{$0}
        
    }
}

let sol = Solution()
sol.Permutation("abb")

