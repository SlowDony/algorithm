//JZ16 合并两个排序的链表
/**
 输入两个单调递增的链表，输出两个链表合成后的链表，当然我们需要合成后的链表满足单调不减规则。
 输入：
 {1,3,5},{2,4,6}
 复制
 返回值：
 {1,2,3,4,5,6}

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
     * @param pHead1 ListNode类
     * @param pHead2 ListNode类
     * @return ListNode类
     */
    ///递归法
    func Merge ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
        if pHead1 == nil && pHead2 != nil {
            return pHead2
        }
        if pHead1 != nil && pHead2 == nil {
            return pHead1
        }
        
        if pHead1 == nil && pHead2 == nil {
            return nil
        }
        
        if pHead1!.val <= pHead2!.val {
            pHead1?.next = Merge(pHead1?.next, pHead2)
            return pHead1
        }else {
            pHead2?.next = Merge(pHead1, pHead2?.next)
            return pHead2
        }
        
    }
    
    ///迭代法
    func Merge1 ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        // write code here
       let newHead = ListNode(-1)
       var cur = newHead
       var pHead1 = pHead1
       var pHead2 = pHead2
       while pHead1 != nil && pHead2 != nil {
           
           if pHead1!.val <= pHead2!.val {
                cur.next =  pHead1
               pHead1 = pHead1!.next
           }else{
                cur.next =  pHead2
               pHead2 = pHead2!.next
           }
            cur = cur.next!
       }
            cur.next = pHead1 != nil ? pHead1:pHead2
       return newHead.next
        
    }
}

