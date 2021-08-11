//17.JZ2 替换空格
/**
 请实现一个函数，将一个字符串中的每个空格替换成“%20”。例如，当字符串为We Are Happy.则经过替换之后的字符串为We%20Are%20Happy。
 
 输入：
 "We Are Happy"
 复制
 返回值：
 "We%20Are%20Happy"
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param s string字符串
     * @return string字符串
     */
    func replaceSpace(s:String) -> String{
        var sArr = [String]()
        for i in s {
            if  i == " " {
                sArr.append("%20")
            }else{
                sArr.append(i.description)
            }
        }
        return sArr.joined()
        
    }
}

let s =  Solution()
s.replaceSpace(s: "We Are Happy")


