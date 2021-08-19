//57.JZ63 数据流中的中位数
/**
 描述
 如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。我们使用Insert()方法读取数据流，使用GetMedian()方法获取当前读取数据的中位数。
 示例1
 输入：
 [5,2,3,4,1,6,7,0,8]
 复制
 返回值：
 "5.00 3.50 3.00 3.50 3.00 3.50 4.00 3.50 4.00 "
 复制
 说明：
 数据流里面不断吐出的是5,2,3...,则得到的平均数分别为5,(5+2)/2,3...  
 */
import Foundation

class MedianFinder1 {
    
    /** initialize your data structure here. */
    //二分查找
    var arr = [Int]()
    init() {
        
    }
    
    func addNum(_ num: Int) {
        if arr.count == 0 || num>arr.last! {
            arr.append(num)
        }else{
            let index = bs(nums: arr, target: num)
            arr.insert(num, at: index)
        }
    }
    
    func findMedian() -> Double {
        let mid = (arr.count-1)/2
        if arr.count % 2 == 0 {
            return Double(arr[mid]+arr[mid+1])/2.0
        }else{
            return Double(arr[mid])
        }
    }
    
    func bs(nums:[Int],target:Int) ->  Int{
        var left = 0,right = nums.count-1
        while left<right {
            let mid = left+(right-left)/2
            if nums[mid] < target
            {
                left = mid+1
            }else{
                right = mid
            }
        }
        return left
    }
    
    
}


class MedianFinder {
    
    /** initialize your data structure here. */
    var queueMax:[Int] //大顶堆,最大值也小于小顶堆的最小值 ----正序排列 小->大 (用数组模拟,最大的在最后面,相当于栈顶元素)
    
    var queueMin:[Int] //小顶堆,最小值也大于大顶堆的最大值 ----倒叙排列 大->小 (用数组模拟,最小的在最后面,相当于栈顶元素)
    var count = 0
    init() {
        queueMax = [Int]()
        queueMin = [Int]()
    }
    
    func addNum(_ num: Int) {
        var num = num
        //偶数小顶堆
        if count % 2 == 0
        {
            if !queueMax.isEmpty && queueMax.last!>num {
                let old = queueMax.removeLast()
                appendMax(num: num)
                num = old
            }
            appendMin(num: num)
        }else{
            if !queueMin.isEmpty && queueMin.last! < num {
                let old = queueMin.removeLast()
                appendMin(num: num)
                num = old
            }
            appendMax(num: num)
        }
        count+=1
        
    }
    
    func findMedian() -> Double {
        let size = queueMax.count + queueMin.count
        if size  == 0 {
            return 0.0
        }
        //偶数
        if size & 1 == 0 {
            return (Double(queueMax.last!+queueMin.last!)/2.0)
        }else{
            print(queueMin)
            return Double(queueMin.last!)
        }
    }
    
    ///倒叙 3 2 1
    func quaueSort(res:[Int])->[Int]{
        return res.sorted{$0>$1}
    }
    
    ///正序 1 2 3
    func quaueSortB(res:[Int])->[Int]{
        return res.sorted{$0<$1}
    }
    
    
    func appendMax(num:Int){
        queueMax.append(num)
        queueMax = quaueSortB(res: queueMax)
        print("queueMax:\(queueMax)")
        
    }
    
    func appendMin(num:Int){
        queueMin.append(num)
        queueMin = quaueSort(res: queueMin)
        print("queueMin:\(queueMin)")
    }
    
}

let sol1 = MedianFinder1()
//var arr =  [5,2,4,3,1,6]
//for i in arr {
//    print("i:\(i)")
//    sol1.addNum(i)
//}
sol1.addNum(1)
sol1.addNum(2)
sol1.findMedian()
sol1.addNum(3)
sol1.findMedian()




