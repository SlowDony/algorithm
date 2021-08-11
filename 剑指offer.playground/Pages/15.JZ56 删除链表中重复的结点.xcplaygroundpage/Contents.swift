//JZ56 删除链表中重复的结点

/**
 
 描述
 在一个排序的链表中，存在重复的结点，请删除该链表中重复的结点，重复的结点不保留，返回链表头指针。 例如，链表1->2->3->3->4->4->5 处理后为 1->2->5
 
 输入：
 {1,2,3,3,4,4,5}
 复制
 返回值：
 {1,2,5}

 
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
     * @param pHead ListNode类
     * @return ListNode类
     */
    func deleteDuplication ( _ pHead: ListNode?) -> ListNode?
    {
    //虚拟头结点,减少边界判断
      let dummy = ListNode(-1)
      //有效链表的结尾
      var tail = dummy
      ///通过源phead指针进行链表扫描
      var pHead = pHead
      while pHead != nil {
          //进入循环
          if pHead?.next == nil || pHead?.next?.val != pHead?.val {
              tail.next = pHead
              tail = pHead!
          }
          
        while pHead?.next != nil && pHead?.val == pHead?.next?.val {
            pHead = pHead?.next
        }
        pHead = pHead?.next
      }
      tail.next = nil
      return dummy.next
    }
    func deleteDuplication1 ( _ pHead: ListNode?) -> ListNode? {
        // write code here
        
        let dummy = ListNode(-1)
                var newHead = pHead
                dummy.next = newHead
                
                while newHead != nil {
                    if newHead?.val == newHead?.next?.val {
                        newHead?.next = newHead?.next?.next
                    } else {
                        newHead = newHead?.next
                    }
                }
                
                return dummy.next
    }
}



