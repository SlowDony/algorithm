//JZ38 二叉树的深度
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
     * @return int整型
     */
    func TreeDepth ( _ pRoot: TreeNode?) -> Int {
        // write code here
        if  pRoot == nil {
            return 0
        }
        let leftcount = TreeDepth(pRoot?.left)
        let rightcount = TreeDepth(pRoot?.right)
        return max(leftcount, rightcount) + 1
    }
}
