import Foundation
//NC76 用两个栈实现队列

class MyQueue {

    /** Initialize your data structure here. */
    var inputStack:[Int]
    var outputStack:[Int]
    init() {
        inputStack = [Int]()
        outputStack = [Int]()
    }
    
    /** Push element x to the back of queue. */
    //加入元素
    func push(_ x: Int) {
        inputStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    //移除栈顶元素
    func pop() -> Int {
        outputStack.append(inputStack.removeLast())
        if outputStack.isEmpty {
            
        }
        return outputStack.popLast() ?? -1
    }
    
    /** Get the front element. */
    //当前栈顶元素
    func peek() -> Int {
        
        return outputStack.last ?? -1
    }
    
    /** Returns whether the queue is empty. */
    //是否为空
    func empty() -> Bool {
        return outputStack.isEmpty && inputStack.isEmpty
    }
}
