import Foundation

//20.NC1 大数加法
/**
 描述
 以字符串的形式读入两个数字，编写一个函数计算它们的和，以字符串形式返回。
 （字符串长度不大于100000，保证字符串仅由'0'~'9'这10种字符组成）
 
 输入：
 "1","99"
 返回值：
 "100"
 说明：
 1+99=100
 */

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 计算两个数之和
     * @param s string字符串 表示第一个整数
     * @param t string字符串 表示第二个整数
     * @return string字符串
     */
    func solve ( _ s: String,  _ t: String) -> String {
        // write code here
        
       
        
        if s.count>100000 || t.count > 100000 {
            return "0"
        }
        
        return add2(left: s, right: t)
        
    }
    
    
    func add2(left:String,right:String) -> String {
        var resultStr = ""
        var leftarray = [Int]()
        for char in left{
            leftarray.append(Int(String(char))!)
        }

        var rightarray = [Int]()
        for char in right{
            rightarray.append(Int(String(char))!)
        }
        
        ///carry为是否进位
        var i = leftarray.count-1 ,j = rightarray.count-1,carry = 0
        while i>=0 || j>=0 || carry != 0 {
            var x = 0 , y = 0 , sum = 0
            if i < 0 {
                x = 0
            }else{
                x = leftarray[i]
                i = i - 1
            }
            
            if j < 0 {
                y = 0
            }else{
                y = rightarray[j]
                j = j - 1
            }
            sum = x + y + carry

            resultStr.append(String(sum%10))
            carry = sum/10
        }
        
        var solveStr  = ""
        for string in resultStr.reversed(){
            solveStr.append(string)
        }
        return solveStr
    }
    
    
    func add1(left:String,right:String) -> String {
        
        var resultstr = String()
        
        var leftarray = [Int]()

        for char in left{

            leftarray.insert(Int(String(char))!, at: 0)

        }

        
        var rightarray = [Int]()

        for char in right{

            rightarray.insert(Int(String(char))!, at: 0)

        }
        let maxCount = leftarray.count>rightarray.count ? leftarray.count : rightarray.count

        let minCount = leftarray.count>rightarray.count ? rightarray.count : leftarray.count

        for _ in minCount..<(maxCount - minCount){
            if leftarray.count > rightarray.count {
                rightarray.insert(0, at: 0)
            }else{
                leftarray.insert(0, at: 0)
            }
        }
        
        //较短数的数位

        //The shorter number's count

        
        //数字相加后是否会进十的状态值

        //After plusing , if the result greater than 10,this value turns true.

        var isGreaterThanTen = false

        for index in 0..<maxCount{

            var curResult = leftarray[index] + rightarray[index] + (isGreaterThanTen ? 1 : 0)

            isGreaterThanTen = curResult >= 10

            if isGreaterThanTen{curResult -= 10}

            resultstr.insert(Character(String(curResult)), at: resultstr.startIndex)

        }

        //指定较长的数，来完成短数位后的运算

        //如果计算完毕后，仍会进十，则在首位加1

        //if finished all the calculates,the result still can carrybit,then add 1 to the first position.

        if isGreaterThanTen{

            resultstr.insert("1", at: resultstr.startIndex)

        }

        return resultstr

    }
    
    func add(left:String,right:String) -> String{

        var resultstr = String()

        

        var leftstr = [String]()

        var rightstr = [String]()

        //将数字分割成小数部分以及整数部分

        //Separated the number into decimal part and integer part

        if left.contains("."){

            leftstr = left.components(separatedBy: ".")
            
        }else{

            leftstr = [left]

        }

        
        if right.contains("."){

            rightstr = right.components(separatedBy: ".")

        }else{

            rightstr = [right]

        }

        //处理小数部分    Deal the decimal number.

        //小数状态0代表左右都有小数部分，1代表左边有小数右边没，2代表右边有小数左边没，3代表两边都没有小数

        /**

         *  0:Either left number and right number both have the decimal part

         *  1:Only left number has the decimal part

         *  2:Only right number has the decimal part

         *  3:Both sides do not have the decimal part.

         */

        let decimalStatu = leftstr.count == 2 && rightstr.count == 2 ? 0 : (leftstr.count == 1 && rightstr.count == 1 ? 3 : leftstr.count == 2 && rightstr.count != 2 ? 1 : 2)

        var decimalCanPlus1 = false//The value show the decimal part will full to integer part.一个显示小数位相加后是否可以使整数加1的状态值

        switch decimalStatu {

        case 0:

            
            resultstr.append(contentsOf: ".")

            let leftIsLonger = leftstr[1] > rightstr[1]

            var pstrlong = [Int]()

            var pstrshort = [Int]()

            
            
            
            for char in (leftIsLonger ? leftstr[1] : rightstr[1]){

                pstrlong.insert(Int(String(char))!, at: 0)

            }

            for char in (!leftIsLonger ? leftstr[1] : rightstr[1]){

                pstrshort.insert(Int(String(char))!, at: 0)

            }

            for index in pstrshort.count..<pstrlong.count{

                resultstr.insert(Character(String(pstrlong[index])), at: resultstr.startIndex)
            }

            for index in 0..<pstrshort.count{

                //如果小数可以进位，则末位加1.只加一次

                //If decimal part can full to integer part,integer last number plus 1,only plus once.

                var curResult = pstrlong[index] + pstrshort[index] + (decimalCanPlus1 ? 1 : 0)

                if curResult >= 10{

                    curResult -= 10

                    decimalCanPlus1 = true

                }else{

                    decimalCanPlus1 = false

                }

                resultstr.insert(Character(String(curResult)), at: resultstr.startIndex)
            }

            

        case 1:
            resultstr.append(contentsOf: ".")
            for curNum in leftstr[1]{

                resultstr.append(curNum)

            }

        case 2:
            
            resultstr.append(contentsOf: ".")
            for curNum in rightstr[1]{

                resultstr.append(curNum)

            }

        case 3:

            break

        default:

            fatalError("decimalStatu can not detect two numbers statu")

        }

        //处理整数部分    Deal with the integer part

        var leftarray = [Int]()

        for char in leftstr[0]{

            leftarray.insert(Int(String(char))!, at: 0)

        }

        var rightarray = [Int]()

        for char in rightstr[0]{

            rightarray.insert(Int(String(char))!, at: 0)

        }

        //较短数的数位

        //The shorter number's count

        let minCount = leftarray.count>rightarray.count ? rightarray.count : leftarray.count

        //数字相加后是否会进十的状态值

        //After plusing , if the result greater than 10,this value turns true.

        var isGreaterThanTen = false

        for index in 0..<minCount{

            var curResult = leftarray[index] + rightarray[index] + (isGreaterThanTen ? 1 : 0) + (decimalCanPlus1 ? 1 : 0)

            isGreaterThanTen = curResult >= 10

            decimalCanPlus1 = false

            if isGreaterThanTen{curResult -= 10}

            resultstr.insert(Character(String(curResult)), at: resultstr.startIndex)

        }

        //指定较长的数，来完成短数位后的运算

        //Continue calculate the value after finished the shortnumber dealing.

        let longArray = leftarray.count>rightarray.count ? leftarray : rightarray

        for index in minCount..<(longArray.count){

            var curResult = longArray[index]

            if isGreaterThanTen{

                curResult += 1

                isGreaterThanTen = curResult >= 10

                if isGreaterThanTen{

                    curResult -= 10

                }

            }

            resultstr.insert(Character(String(curResult)), at: resultstr.startIndex)

        }

        //如果计算完毕后，仍会进十，则在首位加1

        //if finished all the calculates,the result still can carrybit,then add 1 to the first position.

        if isGreaterThanTen{

            resultstr.insert("1", at: resultstr.startIndex)

        }

        return resultstr

    }
}

let sol = Solution()
sol.solve("987", "33999")

