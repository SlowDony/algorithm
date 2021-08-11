//31.JZ66 机器人的运动范围
/**
 地上有一个rows行和cols列的方格。坐标从 [0,0] 到 [rows-1,cols-1]。一个机器人从坐标0,0的格子开始移动，每一次只能向左，右，上，下四个方向移动一格，但是不能进入行坐标和列坐标的数位之和大于threshold的格子。 例如，当threshold为18时，机器人能够进入方格[35,37]，因为3+5+3+7 = 18。但是，它不能进入方格[35,38]，因为3+5+3+8 = 19。请问该机器人能够达到多少个格子？
 范围:
 1 <= rows, cols<= 100
 0 <= threshold <= 20
 
 输入：
 1,2,3
 复制
 返回值：
 3
 */
import Foundation
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param threshold int整型
     * @param rows int整型
     * @param cols int整型
     * @return int整型
     */
    func movingCount ( _ threshold: Int,  _ rows: Int,  _ cols: Int) -> Int {
        // write code here
        //记录符合格子是否被访问
        if threshold == 0 {
            return 1
        }
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        print(visited)
        return dfs(rows, cols, 0, 0, threshold, &visited)
    }
    
    func dfs(_ i:Int,_ j:Int,_ rows:Int,_ cols:Int ,_ threshold: Int,_ visited:inout [[Bool]]) -> Int{
        
//        递归的满足条件
        let sum = getSum(x: rows) + getSum(x: cols)
        if rows>=i || cols>=j || sum > threshold || visited[rows][cols] {
            return 0
        }
        visited[rows][cols] = true
        
        return 1+dfs(i, j, rows+1, cols, threshold, &visited)+dfs(i, j, rows, cols+1, threshold, &visited)
    }
    
    //实现位数和的计算 (坐标求和)
    func getSum(x:Int) ->Int{
        var sum = 0
        var x = x
        while x>0 {
            //取余 和加上个位数的值
            sum += x % 10
            //去掉个位数的值
            x = x/10
        }
        return sum
    }
}

let sol = Solution()

sol.movingCount(10, 1, 100)
