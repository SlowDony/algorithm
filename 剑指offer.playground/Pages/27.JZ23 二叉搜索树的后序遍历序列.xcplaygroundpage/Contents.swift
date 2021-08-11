//JZ23 二叉搜索树的后序遍历序列
/**
 描述
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。如果是则返回true,否则返回false。假设输入的数组的任意两个数字都互不相同。（ps：我们约定空树不是二叉搜索树）
 输入：
 [4,8,6,12,16,14,10]
 复制
 返回值：
 true
 
 
 二叉树后续遍历: 左子树,右字数.根节点
 二叉搜索树: 左子树全部小于根节点,右子树所有值大于根节点
 
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param sequence int整型一维数组
     * @return bool布尔型
     */
    func VerifySquenceOfBST ( _ sequence: [Int]) -> Bool {
        // write code here
        return recure(sequence, 0, sequence.count-1)
        
    }
    
    func recure(_ sequence: [Int], _ i:Int,_ j:Int) -> Bool{
        if i>=j {
          return true
        }
        
        var p = i
        while sequence[p] < sequence[j] {
            p += 1
        }
        let m = i
        while sequence[m] > sequence[j] {
            p += 1
        }
        
        return p == j && recure(sequence, i , m-1 ) && recure(sequence, m, j-1)
        
    }
}



