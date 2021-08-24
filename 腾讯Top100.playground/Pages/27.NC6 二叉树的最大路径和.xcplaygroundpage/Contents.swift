//27.NC6 二叉树的最大路径和
/**
 给定一个二叉树，请计算节点值之和最大的路径的节点值之和是多少。
 这个路径的开始节点和结束节点可以是二叉树中的任意节点
 例如：
 
 输入：
 {-2,1}
 返回值：
 1

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
    var maxSum = Int.min
    
    func maxPathSum ( _ root: TreeNode?) -> Int {
        // write code here
        getMax(root)
        return maxSum
    }
    
    ///获取左右的root节点下的最大节点和
    func getMax(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftMax = max(0, getMax(root.left))
        let rightMax = max(0, getMax(root.right))
        
        let rootmax = max(root.val+max(leftMax, rightMax), root.val+leftMax+rightMax)
        
        maxSum = max(maxSum, rootmax)
         
        return max(leftMax, rightMax)+root.val
    }
}


