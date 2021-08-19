import Foundation

//MARK:二叉树的遍历
public class Solution {
    //二叉树 层序遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var res = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        while queue.isEmpty == false {
            
            var temp = [Int]()
            for _ in queue {
                let root = queue.removeFirst()
                
                temp.append(root.val)
                
                if root.left != nil {
                    queue.append(root.left!)
                }
                if root.right != nil {
                    queue.append(root.right!)
                }
            }
            res.append(temp)
        }
        return res
    }
    
    // ⼆叉树的右视图
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if  root == nil {
            return []
        }
        var res = [Int]()
        var queue = [TreeNode]()
        queue.append(root!)
        while queue.isEmpty == false {
            var temp = [Int]()
            for _ in 0..<queue.count {
                let root = queue.removeFirst()
                temp.append(root.val)
                if root.left != nil {
                    queue.append(root.left!)
                }
                if root.right != nil {
                    queue.append(root.right!)
                }
            }
            res.append(temp.last!)
        }
        return res
    }
    //  637. 二叉树的层平均值
    //      https://leetcode-cn.com/problems/average-of-levels-in-binary-tree/
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        if  root == nil {
            return []
        }
        var res = [Double]()
        var queue = [TreeNode]()
        queue.append(root!)
        while queue.isEmpty == false {
            var sum = 0.0
            let count = queue.count
            for _ in 0..<count {
                let root = queue.removeFirst()
                sum += Double(root.val)
                if root.left != nil {
                    queue.append(root.left!)
                }
                if root.right != nil {
                    queue.append(root.right!)
                }
            }
            res.append(Double(sum/Double(count)))
        }
        return res
    }
    
    // 515.在每个树⾏中找最⼤值
    // https://leetcode-cn.com/problems/find-largest-value-in-each-tree-row/
        func largestValues(_ root: TreeNode?) -> [Int] {
            if  root == nil {
                return []
            }
            var res = [Int]()
            var queue = [TreeNode]()
            queue.append(root!)
            while queue.isEmpty == false {
                var maxValue = Int.min
                let count = queue.count
                for _ in 0..<count {
                    let root = queue.removeFirst()
                    maxValue = max(maxValue, root.val)
                    if root.left != nil {
                        queue.append(root.left!)
                    }
                    if root.right != nil {
                        queue.append(root.right!)
                    }
                }
                res.append(maxValue)
            }
            return res
        }
    
}


