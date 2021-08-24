
/**
 将给出的链表中的节点每 k 个一组翻转，返回翻转后的链表
 如果链表中的节点数不是\ k k 的倍数，将最后剩下的节点保持原样
 你不能更改节点中的值，只能更改节点本身。
 要求空间复杂度 \ O(1) O(1)
 例如：
 给定的链表是1\to2\to3\to4\to51→2→3→4→5
 对于 \ k = 2 k=2, 你应该返回 2\to 1\to 4\to 3\to 52→1→4→3→5
 对于 \ k = 3 k=3, 你应该返回 3\to2 \to1 \to 4\to 53→2→1→4→5
 
 输入：
 {1,2,3,4,5},2
 返回值：
 {2,1,4,3,5}

 */
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
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @param k int整型
     * @return ListNode类
     */
    func reverseKGroup ( _ head: ListNode?,  _ k: Int) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        var tail = head
        for _ in 0..<k{
            if tail == nil{
                return head
            }
            tail = tail?.next
        }
        let newHead = reverse(head, tail)
        head?.next = reverseKGroup(tail, k)
        
        // write code here
        return newHead
    }
    
    func reverse(_ head: ListNode?,_ tail: ListNode?) -> ListNode? {
        var pre : ListNode? = nil
        var next : ListNode?
        var head = head
        
        while (head !== tail && head != nil) {
            next = head?.next
            head?.next = pre
            pre = head
            head = next
        }
        return pre
    }
}


//var node5 = ListNode()
//node5.val = 5
//
//var node4 = ListNode()
//node4.val = 4
//node4.next = node5
//
//var node3 = ListNode()
//node3.val = 3
//node3.next = node4

var node2 = ListNode()
node2.val = 2


var node1 = ListNode()
node1.val = 1
node1.next = node2


let sol = Solution()

let node = sol.reverseKGroup(node1, 2)
ListNode.descr(node)
