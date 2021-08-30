//
//  BaseSort.swift
//  Sort
//
//  Created by slowdony on 2021/8/27.
//

import Foundation
class BaseSort: NSObject {
    var arrayList = [Int]()  // 需要排序的数组
    var swapCount = 0   // 交换次数
    var cmpCount = 0    // 比较次数
    fileprivate func sort(array: [Int]) {
        arrayList = array
        
        let startTime = CFAbsoluteTimeGetCurrent()
        sortAction()
        let endTime = CFAbsoluteTimeGetCurrent()
        
        let sortTitle = self
        print("""
        【\(sortTitle)】
        执行时间：\(endTime - startTime)      比较次数：\(cmpCount)      交换次数：\(swapCount)
        ---------------------------------------------------------------------------------
                
        """)
        print(arrayList)
    }
    
    func sortAction(){ }
    
    /// 比较两个元素的大小  等于0:v1=v2  小于0:v1<v2   大于0:v1>v2
    func cmpValue(_ v1: Int, _ v2: Int) -> Int {
        cmpCount += 1
        return v1 - v2
    }
    func cmpIndex(_ index1: Int, _ index2: Int) -> Int {
        let v1 = arrayList[index1]
        let v2 = arrayList[index2]
        
        return cmpValue(v1, v2)
    }
    func swap(_ index1: Int, _ index2: Int) {
        let temp = arrayList[index1]
        arrayList[index1] = arrayList[index2]
        arrayList[index2] = temp
        swapCount += 1
    }
    
    /// 创建一个随机数组
    class func createRandom(count: NSInteger, min: NSInteger, max: NSInteger) -> [NSInteger]{
        var array = [NSInteger]()
        for _ in 0..<count {
            let v = Int(arc4random_uniform(UInt32(max)))+min
            array.append(v)
        }
        return array
    }
    
    ///创建排序数组
    class func careatSort(min:Int,max:Int) -> [Int] {
        var arr = [Int]()
        for i in min..<max {
            arr.append(i)
        }
        return arr
    }

    class func testSorts(array:[NSInteger], _ objs:BaseSort...){
        for obj in objs {
            obj.sort(array: array)
        }
    }
}




