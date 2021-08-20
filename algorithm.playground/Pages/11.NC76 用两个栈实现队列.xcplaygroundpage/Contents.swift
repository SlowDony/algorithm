import Foundation
//NC76 用两个栈实现队列

/**
 队列 :先进先出
 栈:先进后出
 */
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
        
        if outputStack.count<=0 {
            while inputStack.count != 0 {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.popLast() ?? -1
    }
    
    /** Get the front element. */
    //当前栈顶元素
    func peek() -> Int {
        if outputStack.count<=0 {
            while inputStack.count != 0 {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.last ?? -1
    }
    
    /** Returns whether the queue is empty. */
    //是否为空
    func empty() -> Bool {
        return outputStack.isEmpty && inputStack.isEmpty
    }
    
}

//用队列实现栈
/**
 队列 :先进先出
 栈:先进后出
 */
class MyStack {

    /** Initialize your data structure here. */
    var queue1:[Int]
    var queue2:[Int]
    
    init() {
        queue1 = [Int]()
        queue2 = [Int]()
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue2.append(x)
        while queue1.count != 0 {
            queue2.append(queue1.removeFirst())
        }
        let temp = queue1
        queue1 = queue2
        queue2 = temp
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
       return queue1.removeFirst()
    }
    
    /** Get the top element. */
    func top() -> Int {
        return queue1.first ?? -1
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue1.isEmpty
    }
}

let sol = MyStack()
sol.push(1)
sol.push(2)
sol.push(3)
sol.top()
sol.pop()

