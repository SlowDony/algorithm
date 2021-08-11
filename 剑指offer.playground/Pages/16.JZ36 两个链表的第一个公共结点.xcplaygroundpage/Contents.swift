//JZ36 两个链表的第一个公共结点
/**
 描述
 输入两个无环的单链表，找出它们的第一个公共结点。（注意因为传入数据是链表，所以错误测试数据的提示是用其他方式显示的，保证传入数据是正确的）
 
 输入：
 {1,2,3},{4,5},{6,7}
 复制
 返回值：
 {6,7}
 复制
 说明：
 第一个参数{1,2,3}代表是第一个链表非公共部分，第二个参数{4,5}代表是第二个链表非公共部分，最后的{6,7}表示的是2个链表的公共部分
 这3个参数最后在后台会组装成为2个两个无环的单链表，且是有公共节点的
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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var A = headA
        var B = headB
        // 1. A和B要么相等，要么同时为nil，===表示对象相等。
        while A?.val != B?.val {
            A = A == nil ? headB : A!.next
            B = B == nil ? headA : B!.next
        }
        return A
    }
}





