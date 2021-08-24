
//NC62 平衡二叉树

/**
 输入一棵二叉树，判断该二叉树是否是平衡二叉树。
 在这里，我们只需要考虑其平衡性，不需要考虑其是不是排序二叉树
 平衡二叉树（Balanced Binary Tree），具有以下性质：它是一棵空树或它的左右两个子树的高度差的绝对值不超过1，并且左右两个子树都是一棵平衡二叉树。

 注：我们约定空树是平衡二叉树。
 
 输入：
 {1,2,3,4,5,6,7}
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
    /**
        1.求出每个结点为跟的树的高度
        2.然后根据左右子树高度差绝对值小于等于1,就可以判断以每个结点为根的树是否满足定义
     */
    
    func depth(_ root:TreeNode?)-> Int{
        guard let root = root else {
            return 0
        }
        return 1+max(depth(root.left), depth(root.right))
    }
    
    func IsBalanced_Solution ( _ pRoot: TreeNode?) -> Bool {
        // write code here
        guard let root = pRoot else {
            return true
        }
        let leftDepth = depth(root.left)
        let rightDepth = depth(root.right)
        return IsBalanced_Solution(root.left) && IsBalanced_Solution(root.right) && abs(leftDepth-rightDepth)<=1
    }
}
