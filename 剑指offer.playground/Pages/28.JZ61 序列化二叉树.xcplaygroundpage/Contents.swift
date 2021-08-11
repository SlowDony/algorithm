//JZ61 序列化二叉树
/**
 描述
 请实现两个函数，分别用来序列化和反序列化二叉树，不对序列化之后的字符串进行约束，但要求能够根据序列化之后的字符串重新构造出一棵与原二叉树相同的树。

 二叉树的序列化是指：把一棵二叉树按照某种遍历方式的结果以某种格式保存为字符串，从而使得内存中建立起来的二叉树可以持久保存。序列化可以基于先序、中序、后序、层序的二叉树等遍历方式来进行修改，序列化的结果是一个字符串，序列化时通过 某种符号表示空节点（#），以 ！ 表示一个结点值的结束（value!）。

 二叉树的反序列化是指：根据某种遍历顺序得到的序列化字符串结果str，重构二叉树。

 例如，可以根据层序遍历并特定标志空结点的方案序列化，也可以根据满二叉树结点位置的标号规律来序列化，还可以根据先序遍历和中序遍历的结果来序列化。

 假如一棵树共有 2 个结点， 其根结点为 1 ，根结点右子结点为 2 ，没有其他结点。按照上面第一种说法可以序列化为“1,#,2,#,#”，按照上面第二种说法可以序列化为“{0:1,2:2}”，按照上面第三种说法可以序列化为“1,2;2,1”，这三种序列化的结果都包含足以构建一棵与原二叉树完全相同的二叉树的信息。

 不对序列化之后的字符串进行约束，所以欢迎各种奇思妙想
 
 输入：
 {8,6,10,5,7,9,11}
 复制
 返回值：
 {8,6,10,5,7,9,11}
 
 
 广度优先搜索 :按照层次的顺序从上到下遍历所有节点
    层序遍历
 深度优先搜索:可以从一个根开始,一直深延到某个叶子节点,然后到达另一个分支,根据根节点,左节点,右节点排列顺序不同可以分为
    1.前序遍历
    2.中序遍历
    3.后续遍历
 
 */
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
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @return TreeNode类
     */
    func Serialize ( _ root: TreeNode?) -> TreeNode? {
        // write code here
        //序列化
        let str = serialize(root)
        return deserialize(str)
    }
    
    //序列化
    func serialize(_ root:TreeNode?) -> String {
        var str = rserialize(root, str: "")
        if str.last == ","
        {
            str.removeLast()
        }
        return str
        
    }
    //返序列
    func deserialize(_ str: String) -> TreeNode? {
        var arr = str.components(separatedBy: ",")
        return rdeserialize(&arr)
    }
    
    func rserialize(_ root:TreeNode?,str:String) -> String {
        var str = str
        if root == nil {
           str += "NULL,"
        }else {
            str.append("\(String(describing: root!.val)),")
            str = rserialize(root?.left, str: str)
            str = rserialize(root?.right, str: str)
        }
        return str
    }
    
    func rdeserialize(_ strs:inout[String]) -> TreeNode?{
        if strs.first == "NULL" {
            _=strs.remove(at: 0)
            return nil
        }
        let root = TreeNode.init(Int(strs.first!)!)
        _ = strs.remove(at: 0)
        root.left = rdeserialize(&strs)
        root.right = rdeserialize(&strs)
        return root
    }
    
}

let sol = Solution()
let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
sol.serialize(root)
