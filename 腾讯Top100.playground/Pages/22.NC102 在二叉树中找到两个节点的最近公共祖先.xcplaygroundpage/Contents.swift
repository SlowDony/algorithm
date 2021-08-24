
import Foundation
/**
 NC102 在二叉树中找到两个节点的最近公共祖先
 
 给定一棵二叉树(保证非空)以及这棵树上的两个节点对应的val值 o1 和 o2，请找到 o1 和 o2 的最近公共祖先节点。
 注：本题保证二叉树中每个节点的val值均不相同。
 3
 51
 62 08
 
 
 输入：
 [3,5,1,6,2,0,8,#,#,7,4],5,1
 返回值：
 3

 */
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
     * @param root TreeNode类
     * @param o1 int整型
     * @param o2 int整型
     * @return int整型
     */
    func lowestCommonAncestor ( _ root: TreeNode?,  _ o1: Int,  _ o2: Int) -> Int {
        // write code here
        return commonAncestor(root, o1, o2)?.val ?? 0
    }
    
    
    /// o1,o2分别在祖先左右两侧
    ///祖先是o1，o2在祖先左/右侧
    ///祖先是o2，o1在祖先左/右侧
    func commonAncestor (_ root: TreeNode? , _ o1: Int, _ o2: Int) -> TreeNode? {
        let root = root
        ///超过叶子节点,或者root为p/q中的一个直接返回
        if root == nil || root?.val == o1 || root?.val == o2 {
            return root
        }
        
        let leftNode = commonAncestor(root?.left, o1, o2)
        let rightNode = commonAncestor(root?.right, o1, o2)
        if leftNode == nil {
            return rightNode
        }
        if rightNode == nil {
            return leftNode
        }
        return root
    }
}

