///28.NC16 判断二叉树是否对称
/**
 
 描述
 给定一棵二叉树，判断其是否是自身的镜像（即：是否对称）
 例如：下面这棵二叉树是对称的
 1
 /  \
 2    2
 / \    / \
 3 4  4  3
 下面这棵二叉树不对称。
 1
 / \
 2   2
 \    \
 3    3
 备注：
 希望你可以用递归和迭代两种方法解决这个问题
 
 输入：
 {1,2,2}
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

/**
 判断二叉树是否对称
 比较的是根节点的左子树与右子树是不是相互翻转的
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @return bool布尔型
     */
    func isSymmetric ( _ root: TreeNode?) -> Bool {
        // write code here
        guard let root = root else {
            return true
        }
        return compare(root.left, root.right)
    }
    
    
    func compare(_ leftNode:TreeNode? ,_ rightNode:TreeNode?) -> Bool{
        
        //排除空节点
        if leftNode == nil && rightNode != nil {
            return false
        }
        else if leftNode != nil && rightNode == nil {
            return false
        }
        else if leftNode == nil && rightNode == nil {
            return true
        }//排除了空节点,再排除数值不相同的
        else if leftNode?.val != rightNode?.val {
            return false
        }
        
        //此时 左右节点不为空,且数值相同
        let outside = compare(leftNode?.left, rightNode?.right) //
        let inside = compare(leftNode?.right, rightNode?.left)
        let issame = outside && inside
        return issame
    }
}



