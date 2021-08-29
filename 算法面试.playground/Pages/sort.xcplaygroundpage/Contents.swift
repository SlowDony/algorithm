import Foundation

class Solution {
    
    
    //优化方案 如果没有数组本身有序,不需要替换就终止循环
    func bubbleSort1(_ arr:[Int] ) -> [Int] {
        var arr = arr
        for _ in 0..<arr.count {
            var isChange = true
            for j in 1..<arr.count-1 {
                if arr[j-1]>arr[j]{
                    arr.swapAt(j-1, j)
                    isChange = false
                }
            }
            if isChange {
                break
            }
        }
        return arr
    }
    
    //MARK: 快速排序
    //快速排序
    func quickSort(_ arr:[Int]) -> [Int]{
        
        var res = [Int]()
        
        
        return res
        
    }
    func randNumber(_ count:Int, _ min:Int,_ max:Int) -> [Int]{
        var res = [Int]()
        for _ in 0..<count {
            let num = Int(arc4random_uniform(UInt32(max)))+min
            res.append(num)
        }
        return res
    }
}

let  sol  = Solution()
sol.bubbleSort(sol.randNumber(100, 1, 100))


