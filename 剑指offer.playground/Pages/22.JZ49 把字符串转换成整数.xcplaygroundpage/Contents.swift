//JZ49 把字符串转换成整数
/**
 描述
 将一个字符串转换成一个整数，要求不能使用字符串转换整数的库函数。 数值为0或者字符串不是一个合法的数值则返回0
 输入描述：
 输入一个字符串,包括数字字母符号,可以为空
 返回值描述：
 如果是合法的数值表达则返回该数字，否则返回0
 
 输入：
 "+2147483647"
 返回值：
 2147483647
 
 */
import Foundation



public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串
     * @return int整型
     */
    func StrToInt ( _ str: String) -> Int {
        // write code here
        print("\(Int32.max)")
        print(str.isEmpty)
        if str.isEmpty == true || str.count == 0 {
            return 0
        }
        
        let arr = Array(str)
        
        //是否是负数
        var isNegative = false
        //遍历
        var i = 0
        //res
        var res = 0
        
        if arr.first == "-"{
            isNegative = true
        }
        if arr.first == "-" || arr.first == "+" {
            i += 1
        }
        
        while i < arr.count {
            print(i)
            if isNumber(n: arr[i]) {
                let cur:Int = Int(String(arr[i]))!
                if isNegative == false  && (res > Int32.max/10 || res == Int32.max/10 && cur > 7){
                    return 0
                }
                if isNegative == true && (res > Int32.max/10 || res==Int32.max/10 && cur>8){
                    return 0
                }
                res = res*10 + cur
                i += 1
            }else {
                return 0
            }
        }
        return isNegative==false ? res:-res
    }
    
    func isNumber(n:Character) -> Bool{
        return n >= "0" && n <= "9"
    }
    
}

let sol = Solution()
sol.StrToInt("+123")
//9223372036854775807
//-9223372036854775808

//-2147483648 2147483647

