
//23.JZ5 用两个栈实现队列

/**
 用两个栈来实现一个队列，分别完成在队列尾部插入整数(push)和在队列头部删除整数(pop)的功能。 队列中的元素为int类型。保证操作合法，即保证pop操作时队列内已有元素。
 
 示例:
 输入:
 ["PSH1","PSH2","POP","POP"]
 返回:
 1,2
 解析:
 "PSH1":代表将1插入队列尾部
 "PSH2":代表将2插入队列尾部
 "POP“:代表删除一个元素，先进先出=>返回1
 "POP“:代表删除一个元素，先进先出=>返回2
 
 栈是先进后出
 队列是先进先出
 
 
 当插入时，直接插入 stack1
 当弹出时，当 stack2 不为空，弹出 stack2 栈顶元素，如果 stack2 为空，将 stack1 中的全部数逐个出栈入栈 stack2，再弹出 stack2 栈顶元素
 */

import Foundation

class MinStack {
    
    /** initialize your data structure here. */
    
    //辅助栈(存入正常的值)
    private var dataStack: [Int]
    //存入最小值 (每次存时与之前对比,将最小值存入) 移除也是如果当前值为最小时移除
    private var minStack: [Int]
    init() {
        dataStack = [Int]()
        minStack = [Int]()
    }
    
    func push(_ val: Int) {
        dataStack.append(val)
        if minStack.isEmpty == true || val <= minStack.last! {
            minStack.append(val)
        }
    }
    
    func pop() {
        let val = dataStack.popLast()
        if val == minStack.last {
            minStack.popLast()
        }
    }
    
    func top() -> Int {
        return (dataStack.last) ?? 0
    }
    
    func getMin() -> Int {
        return (minStack.last) ?? 0
    }
}


