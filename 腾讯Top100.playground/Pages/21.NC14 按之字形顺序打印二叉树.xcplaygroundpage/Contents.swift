
import Foundation

/**
 给定一个二叉树，返回该二叉树的之字形层序遍历，（第一层从左向右，下一层从右向左，一直这样交替）
 例如：
 给定的二叉树是{1,2,3,#,#,4,5}
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
     * @param pRoot TreeNode类
     * @return int整型二维数组
     */
    func Print ( _ pRoot: TreeNode?) -> [[Int]] {
        // write code here
        ///存储遍历结果
        var res = [[Int]]()
        if pRoot == nil {
            return res
        }
        let pRoot = pRoot
        var queue = [TreeNode]() //用于存储每一层的节点
        queue.append(pRoot!)
        while !queue.isEmpty {
            let n = queue.count
            var temp = [Int]() //用于存储当前遍历的这一层节点
            for _ in 0..<n {
                let node = queue.removeFirst()
                if res.count%2 == 0 {
                    temp.append((node.val))
                }else{
                    temp.insert(node.val, at: 0)
                }
                
                
                if node.left != nil {
                    queue.append((node.left)!)
                }
                if node.right != nil {
                    queue.append((node.right)!)
                }
            }
            res.append(temp)
            
        }
        return res
    }
}

