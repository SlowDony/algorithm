//NC8 二叉树根节点到叶子节点和为指定值的路径
/**
 给定一个二叉树和一个值\ sum sum，请找出所有的根节点到叶子节点的节点值之和等于\ sum sum 的路径，
 例如：
 给出如下的二叉树，\ sum=22 sum=22，
 
 返回
 [
 [5,4,11,2],
 [5,8,9]
 ]
 
 输入：
 {1,2},3
 返回值：
 [[1,2]]

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
     * @param sum int整型
     * @return int整型二维数组
     */
    func pathSum ( _ root: TreeNode?,  _ sum: Int) -> [[Int]] {
        // write code here
        
        var result = [[Int]]()
        var list = [Int]()
        dfs(root, sum, &list, &result)
        return result
    }
    
    func dfs(_ root: TreeNode?, _ sum: Int, _ list:inout [Int] ,_ result:inout [[Int]]) {
        guard let root = root else {
            return
        }
        list.append(root.val)
        if root.left == nil && root.right == nil {
            if sum == root.val {
                result.append(list)
            }
            list.remove(at: list.count-1)
            return
        }
        
        dfs(root.left, sum-root.val, &list, &result)
        dfs(root.right, sum-root.val, &list, &result)
        
        list.remove(at: list.count-1)
    }
}

