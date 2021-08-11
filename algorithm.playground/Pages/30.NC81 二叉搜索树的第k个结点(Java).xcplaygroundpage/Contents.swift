//NC81 二叉搜索树的第k个结点

/**
 
 给定一棵二叉搜索树，请找出其中的第k小的TreeNode结点。
 
 输入：
 {5,3,7,2,4,6,8},3
 返回值：
 4
 说明：
 按结点数值大小顺序第三小结点的值为4
 */

/*
public class TreeNode {
    int val = 0;
    TreeNode left = null;
    TreeNode right = null;

    public TreeNode(int val) {
        this.val = val;

    }

}
public class Solution {
    //记录当前遍历的节点数量
    int index = 0;
    TreeNode KthNode(TreeNode pRoot, int k) {
        TreeNode pNode = null;
        if (pRoot == null || k<=0){
            return pNode;
        }
        pNode = getKthNode(pRoot,k);
        return pNode;
    }
    
    public TreeNode getKthNode(TreeNode pRoot, int k){
        TreeNode node = null;
        if (pRoot.left != null){
            node = getKthNode(pRoot.left,k);
        }
        //pRoot的某个子节点为null时进入下面代码
        index++;
        if (k == index){
            node = pRoot; //满足条件就将pRoot赋值给node
        }
        //当node赋值时已经找到时，不需要再遍历，赋值后就不为null，
        if (node == null && pRoot.right != null){
            node = getKthNode(pRoot.right,k);
        }
        return node;
        
    }


}

 */
