//JZ1 二维数组中的查找
/**
 在一个二维数组array中（每个一维数组的长度相同），每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
 [
 [1,2,8,9],
 [2,4,9,12],
 [4,7,10,13],
 [6,8,11,15]
 ]
 给定 target = 7，返回 true。

 给定 target = 3，返回 false。

 0 <= array.length <= 500
 0 <= array[0].length <= 500
 */
import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param target int整型
     * @param array int整型二维数组
     * @return bool布尔型
     */
    func Find ( _ target: Int,  _ array: [[Int]]) -> Bool {
        // write code here
        
        guard array.count>0 else {
            return false
        }
        
        guard array.first!.count > 0 else {
            return false
        }
        
        ///设置横向和竖向最值
        let rows = array.count, colums = array.first?.count ?? 0
        
        ///row 行数从0开始   colum列数从最右边开始 相当与第一次取最右边的第一个数字
        var row = 0,colum = colums-1
        while row<rows && colum>=0 {
            let number = array[row][colum]
            if number==target {
                return true
            }
            else if number>target {
                colum = colum-1
            }else {
                row = row+1
            }
        }
        
        return false
        
        
    }
}

