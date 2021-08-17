//JZ19 顺时针打印矩阵
/**
 描述
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字，例如，如果输入如下4 X 4矩阵：
 [[1,2,3,4],
 [5,6,7,8],
 [9,10,11,12],
 [13,14,15,16]]
 则依次打印出数字
 
 [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]

 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param matrix int整型二维数组
     * @return int整型一维数组
     */
    func printMatrix ( _ matrix: [[Int]]) -> [Int] {
        // write code here
        
        if matrix.count == 0 {
                    return []
        }
        if matrix.count == 1 {
            return matrix[0]
        }
        var res = [Int]()
        var start = 0
        let row = matrix.count
        let col = matrix[0].count
        
        while row>start*2 && col>start*2 {
            printMatrixCicle(matrix, row, col, res: &res, start)
            start+=1
        }
        return res
        
    }
    
    //环形打印
    //rows 行数
    //cols 列数
    func printMatrixCicle (_ matrix:[[Int]],_ rows:Int, _ cols:Int,res:inout[Int],_ start:Int){
        if matrix.count == 0 { return }
        
        
        //最后一行
        let endRow = rows-1-start
        //最后一列
        let endCol = cols-1-start
        //从左到右
        for i in start...endCol {
            res.append(matrix[start][i])
        }
        
        //从右到下
        if start<endRow {
            for i in (start+1)...endRow {
                res.append(matrix[i][endCol])
            }
        }
        
        //从下到左下
        if start<endRow && start<endCol{
            var i = endCol-1
            while i >= start {
                res.append(matrix[endRow][i])
                i -= 1
            }
            
        }
        
        //从左下到左上
        if start < endCol && start < endRow-1 {
            var i = endRow-1
            while i>start {
                res.append(matrix[i][start])
                i -= 1
            }
            
        }
    }
    
    
}


let sol = Solution()
//sol.printMatrix([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]])
sol.printMatrix([[1,2],[3,4],[5,6],[7,8],[9,10]])
