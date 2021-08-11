

import Foundation
/**
 给定某二叉树的前序遍历和中序遍历，请重建出该二叉树并返回它的头结点。
 例如输入前序遍历序列{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}，则重建出如下图所示。
 
 提示:
 1.0 <= pre.length <= 2000
 2.vin.length == pre.length
 3.0 <= pre[i], vin[i] <= 10000
 4.pre 和 vin 均无重复元素
 5.vin出现的元素均出现在 pre里
 6.只需要返回根结点，系统会自动输出整颗树做答案对比
 
 输入：
 [1,2,4,7,3,5,6,8],[4,7,2,1,5,3,8,6]
 返回值：
 {1,2,3,4,#,5,6,#,7,#,#,8}
 说明：
 返回根节点，系统会输出整颗二叉树对比结果
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

/**
 
 根据中序遍历和前序遍历可以确定二叉树，具体过程为：

 根据前序序列第一个结点确定根结点
 根据根结点在中序序列中的位置分割出左右两个子序列
 对左子树和右子树分别递归使用同样的方法继续分解
 例如：
 前序序列{1,2,4,7,3,5,6,8} = pre
 中序序列{4,7,2,1,5,3,8,6} = in

 根据当前前序序列的第一个结点确定根结点，为 1
 找到 1 在中序遍历序列中的位置，为 in[3]
 切割左右子树，则 in[3] 前面的为左子树， in[3] 后面的为右子树
 则切割后的左子树前序序列为：{2,4,7}，切割后的左子树中序序列为：{4,7,2}；切割后的右子树前序序列为：{3,5,6,8}，切割后的右子树中序序列为：{5,3,8,6}
 对子树分别使用同样的方法分解
 
 */
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param pre int整型一维数组
     * @param vin int整型一维数组
     * @return TreeNode类
     */
    func reConstructBinaryTree ( _ pre: [Int],  _ vin: [Int]) -> TreeNode? {
        // write code here
        if pre.count == 0 || vin.count == 0 {
            return nil
        }
        
        //创建根节点
        let root = TreeNode(pre[0])
        
        for i in 0..<vin.count {
            //找到中排序的二叉树
            if vin[i] == pre[0] {
                //左子树
                root.left = reConstructBinaryTree(Array(pre[1..<(i+1)]), Array(vin[0..<i]))
                print(Array(pre[1..<(i+1)]))
                //右子数
                root.right = reConstructBinaryTree(Array(pre[(i+1)..<pre.count]), Array(vin[(i+1)..<vin.count]))
                break
            }
        }
        
        return root
    }
}

let sol = Solution()
let tree = sol.reConstructBinaryTree([1,2,4,7,3,5,6,8], [4,7,2,1,5,3,8,6])

