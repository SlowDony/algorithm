//JZ26 二叉搜索树与双向链表
/**
 输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的双向链表。如下图所示


 注意:
 1.要求不能创建任何新的结点，只能调整树中结点指针的指向。当转化完成以后，树中节点的左指针需要指向前驱，树中节点的右指针需要指向后继
 2.返回链表中的第一个节点的指针
 3.函数返回的TreeNode，有左右指针，其实可以看成一个双向链表的数据结构
 4.你不用输出或者处理，示例中输出里面的英文，比如"From left to right are:"这样的，程序会根据你的返回值自动打印输出
 
 示例:
 输入: {10,6,14,4,8,12,16}
 输出:From left to right are:4,6,8,10,12,14,16;From right to left are:16,14,12,10,8,6,4;
 解析:
 输入就是一棵二叉树，如上图，输出的时候会将这个双向链表从左到右输出，以及
 从右到左输出，确保答案的正确
 */
import Foundation

public class Solution {
    
    var pre:TreeNode?//尾节点
    var head:TreeNode?//头结点
    
    func Convert(_ pRoot: TreeNode?) -> TreeNode?{
        if let p = pRoot {
            dfs(p) //此时链表已经遍历完,需要把头结点和尾结点首尾相连
            head?.left = pre
            pre?.right = head
            return head
        }
        
        return nil
    }
    
    func dfs(_ pRoot:TreeNode?){
        if let cur = pRoot {
            dfs(pRoot?.left)
            
            if pre != nil {
                pre?.right = cur //如果pre不为空,则说明此时pre已经不是第一个节点了,
            }else{
                head = cur
            }
            cur.left = pre
            pre = cur //保存当前节点
            
            
            dfs(pRoot?.right)
        }else{
            return
        }
    }
    
}

let sol = Solution()
let str = "1,2,3,4,#,#,5,6"

let node2 = TreeNode(2)
let node3 = TreeNode(3)
let node = TreeNode(1)
node.left = node2
node.right = node3


sol.Convert(node)


//TreeNode.init(0, nil, nil)

