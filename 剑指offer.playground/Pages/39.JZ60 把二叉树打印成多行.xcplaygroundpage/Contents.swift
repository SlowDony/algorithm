//JZ60 把二叉树打印成多行
/**
 从上到下按层打印二叉树，同一层结点从左至右输出。每一层输出一行。
 例如：
 给定的二叉树是{1,2,3,#,#,4,5}

 该二叉树多行打印层序遍历的结果是
 [
 [1],
 [2,3],
 [4,5]
 ]

 示例1
 输入：
 {1,2,3,#,#,4,5}
 复制
 返回值：
 [[1],[2,3],[4,5]]
 复制
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
                var temp = [Int]() //存储每层节点
                for _ in 0..<queue.count {
                    let q = queue.removeFirst()
                    temp.append(q.val)
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


