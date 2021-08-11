
import Foundation

public class ListNode {
   public var val: Int
   public var next: ListNode?
   public init(_ val: Int = 0, _ next: ListNode? = nil) {
     self.val = val
     self.next = next
   }
   static public func descr(_ head:ListNode?){
            var node = head
            while node != nil{
                print("\(node?.val ?? 0) ")
                node = node?.next
            }
        }
}

public class Solution {
    /**
     代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     @param l1 ListNode类
     @param l2 ListNode类
     @return ListNode类
     */
    ///递归
    func mergeTwoLists ( _ l1: ListNode?,  _ l2: ListNode?) -> ListNode? {
        // write code here
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        
        //把小的赋值给first
        let first = (l1!.val < l2!.val) ? l1 : l2!
        first?.next = mergeTwoLists(first?.next, ((first === l1) ? l2 : l1))
        return first
    }
    
      ///辅助头
     func headLists ( _ l1: ListNode?,  _ l2: ListNode?) -> ListNode? {
        // write code here
        guard l1 != nil else {
            return l2
        }
        guard l2 != nil else {
            return l1
        }
        var l1 = l1 , l2 = l2
        ///辅助头
        let head = ListNode(0, nil)
        var tail = head
        
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val
            {
                tail.next = l1
                l1 = l1?.next
            }else{
                tail.next = l2
                l2 = l2?.next
            }
            tail = tail.next!
        }
        tail.next = (l1 == nil) ? l2 : l1
        
        return head.next
    }
}


var node1 = ListNode()
node1.val = 30

var node2 = ListNode()
node2.val = 20

let sol = Solution()

let node = sol.mergeTwoLists(node1, node2)
ListNode.descr(node)
