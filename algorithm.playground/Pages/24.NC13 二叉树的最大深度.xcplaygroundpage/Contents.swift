//NC13 二叉树的最大深度
/**
 求给定二叉树的最大深度，
 最大深度是指树的根结点到最远叶子结点的最长路径上结点的数量。
 
 输入：
 {1,2}
 返回值：
 2
 
 输入：
 {1,2,3,4,#,#,5}
 返回值：
 3


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
     * @param root TreeNode类
     * @return int整型
     */
    func maxDepth ( _ root: TreeNode?) -> Int {
        // write code here
        guard let root = root else {
            return 0
        }
        var stack = [TreeNode]()
        var level = [Int]()
        stack.append(root)
        level.append(1)
        var maxCount = 0
        while stack.isEmpty == false {
            //stack中的元素和level中的元素同时出栈
            let node = stack.removeFirst()
            let temp = level.removeFirst()
            maxCount = max(temp, maxCount)
            if node.left != nil {
                stack.append(node.left!)
                level.append(temp+1)
            }
            if node.right != nil {
                stack.append(node.right!)
                level.append(temp+1)
            }
        }
        return maxCount
    }
    
    
    /// 递归调用
    func maxDepth1 ( _ root: TreeNode?) -> Int {
        // write code here
        guard let root = root else {
            return 0
        }
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        let res = max(leftDepth, rightDepth)
        return res+1
    }
}

