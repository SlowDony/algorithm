import UIKit

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
     * @param root TreeNode类 the root of binary tree
     * @return int整型二维数组
     */
    func threeOrders ( _ root: TreeNode?) -> [[Int]] {
        // write code here
        var res = [[Int]]()
        var list = [Int]()
        
        preOrder(root, &list)
        res.append(list)
//        print(list)
        list.removeAll()
        
        inOrder(root, &list)
        res.append(list)
//        print(list)
        list.removeAll()
        
        postOrder(root, &list)
        res.append(list)
       // print(list)
        list.removeAll()
//        print("-----res-----")
        print(res)
        return res
    }
    
    ///inout是使用地址值传递
    func preOrder(_ root: TreeNode?, _ list:inout Array<Int>){
        guard root != nil else {
            return
        }
        list.append(root!.val)
        preOrder(root?.left, &list)
        preOrder(root?.right, &list)
        
    }
    
    func inOrder(_ root: TreeNode?, _ list:inout Array<Int>){
        guard root != nil else {
            return
        }
        inOrder(root?.left, &list)
        list.append(root!.val)
        inOrder(root?.right, &list)
    }
    
    func postOrder(_ root: TreeNode?, _ list:inout Array<Int>){
        guard root != nil else {
            return
        }
        postOrder(root?.left, &list)
        postOrder(root?.right, &list)
        list.append(root!.val)
    }
}

let sol = Solution()
let left = TreeNode(2)
let right = TreeNode(3)
let tree = TreeNode(1, left, right)
sol.threeOrders(tree)


