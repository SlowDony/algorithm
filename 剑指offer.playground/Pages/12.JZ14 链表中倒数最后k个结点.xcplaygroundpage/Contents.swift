//JZ14 链表中倒数最后k个结点
/**
 输入一个链表，输出一个链表，该输出链表包含原链表中从倒数第k个结点至尾节点的全部节点。
 如果该链表长度小于k，请返回一个长度为 0 的链表。
 
 输入：
 {1,2,3,4,5},1
 复制
 返回值：
 {5}
  

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
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var fast = head
        var slow = head
        var dk = k
        while dk>0 {
            fast = fast?.next
            dk -= 1
        }
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        return slow
    }
}

 

