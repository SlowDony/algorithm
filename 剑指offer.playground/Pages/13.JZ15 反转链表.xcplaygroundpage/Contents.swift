//JZ15 反转链表
/**
 输入一个链表，反转链表后，输出新链表的表头。
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
     * @return ListNode类
     */
    //递归
    /**
            递归的三要素
                1.终止条件,2递归调用,3,逻辑处理
     
     */
    func ReverseList ( _ head: ListNode?) -> ListNode? {
        // write code here
        //终止条件
        if head == nil || head?.next == nil {
            return head
        }
        
        //保存当前的下一个节点
        let next = head?.next
        //当前节点的下一个节点开始递归调用
        let p = ReverseList(next)
        //p是反转之后的链表,所以反转之后的链表的next是p的尾节点,然后把当前的head的挂到next节点的后面实现链表反转
        next?.next = head
        //head节点当成了反转后的尾节点
        head?.next = nil
        return p
        
//        var pre:ListNode? = nil
//        var curr = head
//        while (curr != nil){
//            let next = curr?.next
//            curr?.next = pre
//            pre = curr
//            curr = next
//        }
//        return pre
    }
}


