//37.JZ58 对称的二叉树
/**
 描述
 请实现一个函数，用来判断一棵二叉树是不是对称的。注意，如果一个二叉树同此二叉树的镜像是同样的，定义其为对称的。
 示例1
 输入：
 {8,6,6,5,7,7,5}
 复制
 返回值：
 true

 */
import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int=0, _ left: TreeNode?=nil, _ right: TreeNode?=nil) {
        self.val = val
        self.left = left
        self.right = right
    }
    
}
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pRoot TreeNode类
     * @return bool布尔型
     */
    func isSymmetrical ( _ pRoot: TreeNode?) -> Bool {
        // write code here
        return check(pRoot, pRoot)
    }
    
    func check(_ a: TreeNode?,_ b: TreeNode?) -> Bool{
        if a==nil && b==nil {
            return true
        }
        if a==nil || b==nil {
            return false
        }
        if a?.val != b?.val {
            return false
        }
        return check(a?.left, b?.right) && check(a?.right, b?.left)
    }
    
}

