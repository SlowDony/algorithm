//JZ18 二叉树的镜像
/**
 操作给定的二叉树，将其变换为源二叉树的镜像。
 比如：    源二叉树
             8
            /  \
           6   10
          / \  / \
         5  7 9 11
         镜像二叉树
             8
            /  \
           10   6
          / \  / \
         11 9 7  5
 示例1
 输入：
 {8,6,10,5,7,9,11}
 复制
 返回值：
 {8,10,6,11,9,7,5}
 
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

class Solution {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if var root = root {
            let left = mirrorTree(root.left)
            let right = mirrorTree(root.right)
            root.left = right
            root.right = left
            return root
        }else{
            return root
        }
        
        
        
    }
}
