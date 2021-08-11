//JZ44 翻转单词序列
/**
 牛客最近来了一个新员工Fish，每天早晨总是会拿着一本英文杂志，写些句子在本子上。同事Cat对Fish写的内容颇感兴趣，有一天他向Fish借来翻看，但却读不懂它的意思。例如，“nowcoder. a am I”。后来才意识到，这家伙原来把句子单词的顺序翻转了，正确的句子应该是“I am a nowcoder.”。Cat对一一的翻转这些单词顺序可不在行，你能帮助他么？
 输入：
 "nowcoder. a am I"
 复制
 返回值：
 "I am a nowcoder."
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param ReverseSentence string字符串
     * @return string字符串
     */
    
    ///
    func ReverseSentence ( _ ReverseSentence: String) -> String {
        if ReverseSentence.isEmpty == true || ReverseSentence.count == 0 {
            return ReverseSentence
        }
        //转换成字符数组
        var arr = Array(ReverseSentence)
        reverse(&arr, 0, arr.count-1)
        var start = 0
        var end = 0
        while start < arr.count {
            if arr[start] == " " {
                start += 1
                end += 1
            }else if end == arr.count || arr[end] == " "{
                reverse(&arr, start, end-1)
                end += 1
                start = end
            }else {
                end += 1
            }
            
        }
        return String(arr)
    }
    
    func reverse(_ arr:inout [Character],_ begin:Int,_ end:Int){
        var begin = begin , end = end
        
        while begin < end {
            let temp = arr[begin]
            arr[begin] = arr[end]
            arr[end] = temp
            begin += 1
            end -= 1
        }
    }
    
    ///函数调用
    func ReverseSentence1 ( _ ReverseSentence: String) -> String {
        // write code here
        //1.通过空格分割成数组
        //2.把数组进行排序
        //3.然后将数组以空格分割成字符串
        return ReverseSentence.split(separator: " ")
            .reversed()
            .joined(separator: " ")
    }
}

let sol = Solution()
sol.ReverseSentence("nowcoder. a am I")



