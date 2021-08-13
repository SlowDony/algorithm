//38.JZ59 按之字形顺序打印二叉树
/**
 描述
 给定一个二叉树，返回该二叉树的之字形层序遍历，（第一层从左向右，下一层从右向左，一直这样交替）
 例如：
 给定的二叉树是{1,2,3,#,#,4,5}
 给定的二叉树是{1,2,3,#,#,4,5}

 该二叉树之字形层序遍历的结果是
 [
 [1],
 [3,2],
 [4,5]
 ]
 示例1
 输入：
 {1,2,3,#,#,4,5}
 复制
 返回值：
 [[1],[3,2],[4,5]]
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
     * @param pRoot TreeNode类
     * @return int整型二维数组
     */
    func Print ( _ pRoot: TreeNode?) -> [[Int]] {
        // write code here
        var res = [[Int]]()
        if let pRoot = pRoot {
            var queue = [TreeNode]()
            queue.append(pRoot)
            while queue.isEmpty == false {
                var temp = [Int]()
                let count = queue.count
                for _ in 0..<count {
                    let q = queue.removeFirst()
                    if res.count % 2 == 0 {
                        temp.append(q.val)
                    }else{
                        temp.insert(q.val, at: 0)
                    }
                    
                    if q.left != nil {
                        queue.append(q.left!)
                    }
                    if q.right != nil {
                        queue.append(q.right!)
                    }
                }
                res.append(temp)
            }
        }
        return res
    }
}

