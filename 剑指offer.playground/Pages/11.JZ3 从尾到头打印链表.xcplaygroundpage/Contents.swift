//JZ3 从尾到头打印链表
/*
输入一个链表的头节点，按链表从尾到头的顺序返回每个节点的值（用数组返回）。

如输入{1,2,3}的链表如下图:

返回一个数组为[3,2,1]

0 <= 链表长度 <= 1000
 
 输入：
 {1,2,3}
 复制
 返回值：
 [3,2,1]

 */
import Foundation

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int = 0, _ next: ListNode? = nil) {
    self.val = val
    self.next = next
   }
}

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @return int整型一维数组
     */
    //递归
    func printListFromTailToHead ( _ head: ListNode?) -> [Int] {
        // write code here
        guard head != nil else {
            return []
        }
        var next = printListFromTailToHead(head?.next)
        next.append(head!.val)
        return next
    }
    
    
}


