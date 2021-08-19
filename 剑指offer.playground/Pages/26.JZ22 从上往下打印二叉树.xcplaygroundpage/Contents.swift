//JZ22 从上往下打印二叉树
/**
 从上往下打印出二叉树的每个节点，同层节点从左至右打印。
 示例1
 输入：
 {5,4,#,3,#,2,#,1}
 复制
 返回值：
 [5,4,3,2,1]
 
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
     代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     @param root TreeNode类
     @return int整型一维数组
     */
    ///层序遍历二叉树
    func PrintFromTopToBottom ( _ root: TreeNode?) -> [Int] {
        if root == nil {
            return [Int]()
        }
        //创建队列,用于存储每层二叉树
        var queue = [TreeNode]()
        //创建数组存每层二叉树的值
        var res = [Int]()
        queue.append(root!)
        while queue.isEmpty == false {
            let tree = queue.removeFirst()
            res.append(tree.val)
            if tree.left != nil {
                queue.append(tree.left!)
            }
            
            if tree.right != nil {
                queue.append(tree.right!)
            }
        }
        return res
        
    }
}
