
import UIKit



/// 07.NC15 求二叉树的层序遍历
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
     * @return int整型二维数组
     * 
     */
    //队列
    func levelOrder ( _ root: TreeNode?) -> [[Int]]
    {
        // write code here
        ///存储遍历结果
        var res = [[Int]]()
        if root == nil {
            return res
        }
        let pRoot = root
        var queue = [TreeNode]() //用于存储每一层的节点
        queue.append(pRoot!)
        while !queue.isEmpty {
            let n = queue.count
            var temp = [Int]() //用于存储当前遍历的这一层节点
            for _ in 0..<n {
                let node = queue.removeFirst()
                temp.append((node.val))
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
    
    
    //递归
    func levelOrder1 ( _ root: TreeNode?) -> [[Int]] {
        // write code here
        guard root != nil else {
            return []
        }
        
        var res = [[Int]]()
        count(root!,0,&res)
        return res
    }
    
    func count(_ node: TreeNode,_ level: Int,_ res:inout [[Int]]){
        if level == res.count{
            res.append([Int]())
        }
        res[level].append(node.val)
        if node.left != nil {
            count(node.left!, level+1,&res)
        }
        if node.right != nil {
            count(node.right!, level+1, &res)
        }
    }
}


