import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int=0, _ left: TreeNode?=nil, _ right: TreeNode?=nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode {
    //打印二叉树 1,2,3,4,#,#,5
    open func descr(){
        let root:TreeNode? = self
        var list = [TreeNode?]()
        var cout = 1
        list.append(root!)
        var strArray = [String]()
        var n = 1
        while !list.isEmpty {
            var end = true
            var lineStr = ""
            n *= 2
            for _ in 0..<cout {
                let node = list.first!
                if node != nil {
                    list.append(node!.left)
                    list.append(node!.right)
                    lineStr += "\(node!.val),"
                    end = false
                }
                else{
                    list.append(nil)
                    list.append(nil)
                    lineStr += "#,"
                }
                list.removeFirst()
            }
            cout = list.count
            if !end {
                strArray.append(lineStr)
            }
            else{
                break
            }
        }
        //打印
        print("----------------------打印二叉树------------------------")
        print(strArray)
        var m = 1
        n /= 2
        for str in strArray {
            
            var tempStr = String.init(repeating: " ", count: n / 2 - m)
            tempStr += str
            print(tempStr)
            m *= 2
        }
        print("-------------------------------------------------------")
    }
    

    //字符串 -> 二叉树 1,2,3,4,#,#,5
    public static func Tree(_ str:String) -> TreeNode?{
        if str.isEmpty {
            return nil
        }
        
        var list = [Int]()
        for str in str.split(separator: Character(",")) {
            if str == "#" {
                list.append(Int.max)
            }
            else{
                list.append(Int(str) ?? 0)
            }
        }
        if list.count < 1 {
            return nil
        }
    
        let root:TreeNode = TreeNode.init(list.first!)
        list.removeFirst()
        var queue = [root]
        var count = 1
        while queue.count > 0 {
            for _ in 0..<count {
                let pRoot = queue.removeFirst()
                if list.first != nil{
                    if list.first != Int.max {
                        let left = TreeNode.init(list.first!)
                        pRoot.left = left
                        queue.append(left)
                    }
                }
                if  list.first != nil {
                    if list.first != Int.max {
                        let right = TreeNode.init(list.first!)
                        pRoot.right = right
                        queue.append(right)
                    }
                    list.removeFirst()
                }
                queue.removeFirst()
            }
            count = queue.count
        }
        return root
    }
}
