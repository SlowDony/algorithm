//31.NC84 完全二叉树结点数
/**
 给定一棵完全二叉树的头节点head，返回这棵树的节点个数。如果完全二叉树的节点数为N，请实现时间复杂度低于O(N)的解法。
 示例1
 输入：
 {1,2,3}
 返回值：
 3
 */
import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    init(_ val:Int=0,_ left: TreeNode?=nil ,_ right:TreeNode?=nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head TreeNode类
     * @return int整型
     */
    func nodeNum ( _ head: TreeNode?) -> Int {
        // write code here
        return getNodesNum(head)
    }
    
    func getNodesNum (_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        let leftNum = getNodesNum(node.left)
        let rightNum = getNodesNum(node.right)
        return leftNum+rightNum+1
    }
}
