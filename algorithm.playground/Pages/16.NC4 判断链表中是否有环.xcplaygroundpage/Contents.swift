
import Foundation
//NC4 判断链表中是否有环
/**
 判断给定的链表中是否有环。如果有环则返回true，否则返回false。
 你能给出空间复杂度的解法么？
 输入分为2部分，第一部分为链表，第二部分代表是否有环，然后回组成head头结点传入到函数里面。-1代表无环，其他的数字代表有环，这些参数解释仅仅是为了方便读者自测调试
 
 */
/**
 //java
 public class Solution {
     public boolean hasCycle(ListNode head) {
         if (head == null) return false;
         ListNode slow = head;
         ListNode fast = head;
         while (fast != null && fast.next != null){
             slow = slow.next;
             fast = fast.next.next;
             if (slow == fast){
                 return true;
             }
         }
         return false;
             
     }
 }
 */


