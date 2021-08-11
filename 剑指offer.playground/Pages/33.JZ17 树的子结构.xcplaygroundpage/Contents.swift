//33.JZ17 树的子结构
/**
 描述
 输入两棵二叉树A，B，判断B是不是A的子结构。（ps：我们约定空树不是任意一个树的子结构）
 示例1
 输入：
 {8,8,#,9,#,2,#,5},{8,9,#,2}
 复制
 返回值：
 true
 
 
 思路:1.先序遍历A的每个节点nA: HasSubtree函数
     2.判断以nA中的根节点的子树里是否包含B :recur函数
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
     * @param pRoot1 TreeNode类
     * @param pRoot2 TreeNode类
     * @return bool布尔型
     */
    func HasSubtree ( _ pRoot1: TreeNode?,  _ pRoot2: TreeNode?) -> Bool {
        // write code here
        //pRoot1 和pRoot2为空直接返回,
        //pRoot2是pRoot1的叶子节点需满足一下三种条件之一 所以用||连接
        // 1.recur(pRoot1, pRoot2) == true
        // 2. HasSubtree(pRoot1?.left, pRoot2) == true
        // 3. HasSubtree(pRoot1?.right, pRoot2) == true
        return (pRoot1 != nil && pRoot2 != nil) && (recur(pRoot1, pRoot2) || HasSubtree(pRoot1?.left, pRoot2) || HasSubtree(pRoot1?.right, pRoot2))
    }
    
    //判断pRoot1是否包含pRoot2
    func recur(_ pRoot1: TreeNode?,_ pRoot2:TreeNode?)-> Bool{
        //pRoot2为空,说明pRoot2已经匹配完成(越过叶子节点）
        if pRoot2 == nil {
            return true
        }
        //pRoot1为空,说明已超过树pRoot1叶子节点,匹配失败
        //当pRoot1和pRoot2节点值不相等,说明匹配失败
        if pRoot1 == nil || pRoot1?.val != pRoot2?.val {
            return false
        }
        //判断pRoot1和pRoot2左节点和右节点是否相同
        return recur(pRoot1?.left, pRoot2?.left) && recur(pRoot1?.right, pRoot2?.right)
    }
}
