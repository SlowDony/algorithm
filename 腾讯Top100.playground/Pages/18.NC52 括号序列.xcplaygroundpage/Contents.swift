import Foundation
/*
 描述
 给出一个仅包含字符'(',')','{','}','['和']',的字符串，判断给出的字符串是否是合法的括号序列
 括号必须以正确的顺序关闭，"()"和"()[]{}"都是合法的括号序列，但"(]"和"([)]"不合法。
 
 
 解题思路:
 1.压栈和取栈
 '(','[','{' 这三个就压栈
 ')',']','}' 这三个就取栈，取栈时判断一下是不是对应的括号，如果是就取栈成功，不是就不能取。
 这样最后看栈是不是为空，不为空就说明顺序不正确
 */

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串
     * @return bool布尔型
     */
    
    let dict: [Character:String] = ["{":"}","[":"]","(":")"]
    func isValid ( _ s: String) -> Bool {
        // write code here
        var stack = [Character]()
        for c in s {
            if dict[c] != nil {
                stack.append(c)
            }else {
                if stack.count > 0 { // ①"{([" -> ②"{((
                    let ss = stack.removeLast() //[ -> (
                    if String(c) != dict[ss] { //] -> )
                        return false
                    }
                }else{
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

class Solution1 {
    func isValid1(_ s: String) -> Bool {
        let dic:[Character:Character] = ["}":"{",")":"(","]":"["]
        var stack = [Character]()
        for c in s {
            if dic.keys.contains(c){
                if stack.isEmpty || dic[c] != stack.last{
                    return false
                }
                stack.removeLast()
            }else{
                stack.append(c)
            }
        }
        return stack.isEmpty
    }
    
    
    func isValid(_ s: String) -> Bool {
        let dict:[Character:Character] = ["}":"{",")":"(","]":"["]
        var stack = [Character]()
        
        for c in s {
            print(c)
            print(dict.keys)
            if dict.keys.contains(c) {
                if stack.isEmpty || dict[c] != stack.last {
                    return false
                }
                stack.removeLast()
            }else{
                stack.append(c)
            }
        }
        return stack.isEmpty
    }
}

let sol = Solution1()
sol.isValid("()")
