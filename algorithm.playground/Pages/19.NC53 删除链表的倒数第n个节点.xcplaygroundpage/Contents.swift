//NC53 删除链表的倒数第n个节点
/**
 描述
 给定一个链表，删除链表的倒数第 nn 个节点并返回链表的头指针
 例如，
 给出的链表为: 1\to 2\to 3\to 4\to 51→2→3→4→5, n= 2n=2.
 删除了链表的倒数第 nn 个节点之后,链表变为1\to 2\to 3\to 51→2→3→5.

 备注：
 题目保证 nn 一定是有效的
 请给出请给出时间复杂度为\ O(n) O(n) 的算法
 
 
 输入：
 {1,2},2
 返回值：
 {2}
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
            var arrs : [Any] = [Any]()
            while node != nil{
        //                print("\(node?.val ?? 0) ")
                arrs.append(node?.val ?? "_")
                node = node?.next
            }
            print(arrs)
        }
}

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @param n int整型
     * @return ListNode类
     */
    /**
     思路:我们可以使用两个指针，一个指针fast先走n步，然后另一个指针slow从头结点开始，找到要删除结点的前一个结点，这样就可以完成结点的删除了。
     */
    func removeNthFromEnd ( _ head: ListNode?,  _ n: Int) -> ListNode? {
        // write code here
        guard let head = head else {
            return nil
        }
        
        let node = ListNode(0)
        node.next = head
        var fast = node
        var slow = node
        
        //先让fast走n步
        for _ in 0..<n {
//            fast = fast.next
            fast = fast.next!
        }
        
        //如果fast为空,表示删除的是头节点
        if fast == nil {
            return head.next
        }
        
        while fast.next != nil {
            fast = fast.next!
            slow = slow.next!
        }
        
        //这里最终slow不是倒数第n个节点,他是倒数第n+1个节点,
        //他的下一个节点是倒数第n个节点,所以删除的是他的下一个节点
        slow.next = slow.next!.next
        
        return node.next
        
    }
}

//let node5 = ListNode()
//node5.val = 6
//
//let node4 = ListNode()
//node4.val = 5
//node4.next = node5
//
//let node3 = ListNode()
//node3.val = 4
//node3.next = node4
//
//let node2 = ListNode()
//node2.val = 3
//node2.next = node3

let node1 = ListNode()
node1.val = 2
//node1.next = node2

let node = ListNode()
node.val = 1
node.next = node1

let sol = Solution()
 
ListNode.descr(sol.removeNthFromEnd(node, 2))
