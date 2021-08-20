
import Foundation

//08.NC88 寻找第K大

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param a int整型一维数组
     * @param n int整型
     * @param K int整型
     * @return int整型
     */
    func findKth ( _ a: [Int],  _ n: Int,  _ K: Int) -> Int {
        // write code here
        if  K == 0 || K > n {
            return 0
        }
        var a = a
        let num = findK(&a, 0, n-1, K)
        print(a)
        return num
    }
    
    func findK(_ arr:inout [Int] ,_ left:Int,_ right:Int,_ k:Int) -> Int{
        print("findK")
        if left <= right {
            let pivot = partition(&arr, left, right)
            if pivot == k-1 {
                return arr[pivot]
            }else if pivot < (k-1){
                return findK(&arr, pivot+1, right, k)
            }else {
                return findK(&arr, left, pivot-1, k)
            }
        }
        return -1
    }
    
    
    ///
    /// - Parameters:
    ///   - a: 数组
    ///   - left: 最左边
    ///   - right: 最右边
    func partition(_ a:inout [Int],_ left: Int,_ right: Int) -> Int{
        let pivot = a[left] //参考基准
        var start = left ,  end = right
        while start < end {
            while (start<end && a[end]<=pivot){
                end -= 1
            }
            a.swapAt(start, end)
            while (start<end && a[start]>=pivot) {
                start += 1
            }
            a.swapAt(start, end)
        }
        return start
    }
    
    
    /// 函数
    /// - Parameter a: 数组
    /// - Returns: 返回
    func funcSort(_ a:[Int]) -> [Int]{
        let arr = a.sorted{$0>$1}
        print(arr)
        return arr
    }
    
}

let sol = Solution()
sol.findKth([1,3,2,0,3,1,2,3], 8, 7)



//利用小顶堆排序
/**
 采用优先队列的方式实现最小堆

 遍历一次数组时维护其最小大小为k的优先队列(最小堆)

 遍历结束后返回其首元素即可
 */
class KthLargest {

    var k:Int
    //创建优先队列
    var queue : PriorityQueue<Int>
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.queue = PriorityQueue<Int>()
        for i in nums {
            self.add(i)
        }
    }
    
    func add(_ val: Int) -> Int {
        self.queue.add(val)
        if queue.size>self.k {
            queue.dequeue()
        }
        return queue.peek()!
    }
}

protocol Queue {
    associatedtype DataType: Comparable
    
    /**
     * 将一个新元素插入到队列中
     * - param item: 要添加的元素
     * - return Bool: 插入是否成功
     */
    @discardableResult
    func add(_ item: DataType) -> Bool
    
    /**
     * 删除首个元素
     * - 返回值：被移除的元素
     */
    @discardableResult
    func remove() throws -> DataType
    
    /**
     * 获取队列首个元素，并将其移出队列
     */
    func dequeue() -> DataType?
    
    /**
     * 获取队列中的首个元素，但不将其移出队列
     */
    func peek() -> DataType?
    
    /**
     * 清空队列
     */
    func clear() -> Void
    
}

enum QueueError: Error {
    case noSuchItem(String)
}

private extension Int {
    var leftChild: Int {
        return 2 * self + 1
    }
    
    var rightChild: Int {
        return 2 * self + 2
    }
    
    var parent: Int {
        return (self - 1) / 2
    }
}

class PriorityQueue<DataType: Comparable> {
    // 队列的存储
    private var queue: Array<DataType>
    
    // 当前队列的大小
    public var size: Int {
        return self.queue.count
    }
    
    public init() {
        self.queue = Array<DataType>()
    }
    
    @discardableResult
      public func add(_ item: DataType) -> Bool {
        self.queue.append(item)
        self.heapifyUp(from: self.queue.count - 1)
        return true
      }

      @discardableResult
      public func remove() throws -> DataType {
        guard self.queue.count > 0 else {
          throw QueueError.noSuchItem("Attempt to remove item from an empty queue.")
        }
        return self.popAndHeapifyDown()
      }

      public func dequeue() -> DataType? {
        guard self.queue.count > 0 else {
          return nil
        }
        return self.popAndHeapifyDown()
      }

      public func peek() -> DataType? {
        return self.queue.first
      }

      public func clear() {
        self.queue.removeAll()
      }

      /**
      弹出队列中的第一个元素，并通过将根元素移向队尾的方式恢复最小堆排序。
      - 返回值: 队列中的第一个元素。
      */
      private func popAndHeapifyDown() -> DataType {
        let firstItem = self.queue[0]

        if self.queue.count == 1 {
          self.queue.remove(at: 0)
          return firstItem
        }

        self.queue[0] = self.queue.remove(at: self.queue.count - 1)

        self.heapifyDown()

        return firstItem
      }

      /**
       通过将元素移向队头的方式恢复最小堆排序。
       - 参数 index: 要移动的元素的索引值。
       */
      private func heapifyUp(from index: Int) {
        var child = index
        var parent = child.parent

        while parent >= 0 && self.queue[parent] > self.queue[child] {
          swap(parent, with: child)
          child = parent
          parent = child.parent
        }
      }

      /**
       通过将根元素移向队尾的方式恢复队列的最小堆排序。
       */
      private func heapifyDown() {
        var parent = 0

        while true {
          let leftChild = parent.leftChild
          if leftChild >= self.queue.count {
            break
          }

          let rightChild = parent.rightChild
          var minChild = leftChild
          if rightChild < self.queue.count && self.queue[minChild] > self.queue[rightChild] {
            minChild = rightChild
          }

          if self.queue[parent] > self.queue[minChild] {
            self.swap(parent, with: minChild)
            parent = minChild
          } else {
            break
          }
        }
      }
    
    private func swap(_ firstIndex: Int, with secondIndex: Int) {
        let firstItem = self.queue[firstIndex]
        self.queue[firstIndex] = self.queue[secondIndex]
        self.queue[secondIndex] = firstItem
    }
}
