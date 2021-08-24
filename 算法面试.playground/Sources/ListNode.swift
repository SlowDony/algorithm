import Foundation
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int = 0, _ next: ListNode? = nil) {
    self.val = val
    self.next = next
   }
}

extension ListNode {
    //打印链表
    func descr(){
        var node:ListNode? = self
        var res = ""
        while node != nil{
            res += ("\(node?.val ?? 0),")
            node = node?.next
        }
        print(res)
    }
    
    //数组 -> 链表
    static func list(_ array:[Int]) -> ListNode?{
        if array.isEmpty {
            return nil
        }
        
        let head = ListNode.init(array[0], nil)
        var cur = head
        for i in 1..<array.count {
            let node = ListNode.init(array[i], nil)
            cur.next = node
            cur = node
        }
        return head
    }
}
