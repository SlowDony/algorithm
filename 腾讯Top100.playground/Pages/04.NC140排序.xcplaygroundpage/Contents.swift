import UIKit


/// 快速排序
public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 将给定数组排序
     * @param arr int整型一维数组 待排序的数组
     * @return int整型一维数组
     */
    func MySort ( _ arr: [Int]) -> [Int] {
        
        var preArr:Array<Int> = arr//对arr进行深拷贝,不改变参数内容
        
        return quickSort(&preArr, 0, arr.count-1)
    }
    
    /**
        函数调用
     **/
    func MySortFuns ( _ arr: [Int]) -> [Int] {
        return arr.sorted()
    }
    
    
    /// 快速排序
    /// - Parameter arr: 数组
//    @discardableResult
    private func quickSort(_ arr:inout [Int],_ left:Int,_ right:Int) -> [Int] {
        guard !arr.isEmpty else { //叛空判断,避免崩溃
            return []
        }
        
        if left<right{ //递归
            let middle = partition(&arr, left: left, right: right)
            quickSort(&arr, left, middle-1)
            quickSort(&arr, middle+1, right)
        }
        return arr
    }
    
    //轴点元素
    private func partition(_ arr:inout [Int],left:Int,right:Int) -> Int{
        let prvot = arr[left] //读取分区范围内的左边第一位数值作为基准值
        var index = left + 1 //设定要插入的位置
        
        for i in left...right {
            if arr[i] < prvot{ //如果查找的数值小于基准值
                arr.swapAt(i, index) //则把该值放到左边(即目标值得后面)
                index+=1
            }
        }
        let middle = index - 1
        arr.swapAt(left, middle) //交换目标值得位置到分区的临界点
        return middle
        
    }
}


let solu = Solution()
solu.MySort([3,4,12,01])

