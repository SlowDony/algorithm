//NC9 二叉树中是否存在节点和为指定值的路径
import Foundation

//var str = "Hello, playground"


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
     * @param root TreeNode类
     * @param sum int整型
     * @return bool布尔型
     */
    func hasPathSum ( _ root: TreeNode?,  _ sum: Int) -> Bool {
        // write code here
        
        var result = [[Int]]()
        var list = [Int]()
        dfs(root, sum, &list, &result)
        return result.count != 0
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
