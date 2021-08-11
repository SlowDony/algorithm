//JZ51 构建乘积数组

/**
 
 描述
 给定一个数组A[0,1,...,n-1],请构建一个数组B[0,1,...,n-1],其中B中的元素B[i]=A[0]*A[1]*...*A[i-1]*A[i+1]*...*A[n-1]。不能使用除法。（注意：规定B[0] = A[1] * A[2] * ... * A[n-1]，B[n-1] = A[0] * A[1] * ... * A[n-2];）
 对于A长度为1的情况，B无意义，故而无法构建，因此该情况不会存在
 
 输入：
 [1,2,3,4,5]
 复制
 返回值：
 [120,60,40,30,24]

 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param A int整型一维数组
     * @return int整型一维数组
     */
    func multiply ( _ A: [Int]) -> [Int] {
        // write code here
        
        var B = [Int]()
        for i in 0..<A.count {
            var b1 = 1
            for index in 0..<A.count {
                if i != index { //除去自己其他数相乘
                    b1 *= A[index]
                }
            }
            B.append(b1)
        }
        
        return B
        
    }
}


