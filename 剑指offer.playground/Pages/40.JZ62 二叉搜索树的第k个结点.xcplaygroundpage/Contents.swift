//40.JZ62 二叉搜索树的第k个结点
/**
 描述
 给定一棵二叉搜索树，请找出其中的第k小的TreeNode结点。
 示例1
 输入：
 {5,3,7,2,4,6,8},3
 复制
 返回值：
 4
 复制
 说明：
 按结点数值大小顺序第三小结点的值为4
 */

import Foundation
public class Solution {
    
    var res = 0, count=0
    func KthNode(_ pRoot: TreeNode?,_ k: Int) -> Int {
        if pRoot == nil {
            return 0
        }
        self.count = k
        dfs(pRoot)
        
        return res
    }
    
    //中序遍历(右跟左)
    func dfs(_ pRoot: TreeNode?) {
        if pRoot == nil || count == 0{
            return
        }
        
        dfs(pRoot?.right)
        count -= 1
        if count == 0 {
            res = pRoot!.val
        }
        dfs(pRoot?.left)
    }
}



