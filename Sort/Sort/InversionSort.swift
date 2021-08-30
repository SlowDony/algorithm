//
//  InversionSort.swift
//  Sort
//
//  Created by slowdony on 2021/8/30.
//

import UIKit
//插入排序
/**
 将无须区域的第一个元素插入有序区的指定位置,比较少,交换多
 类似扑克牌的排序
 默认第一个元素排好序,从第二个元素与之前对比,如果小就插在第一个元素的前面,依次类推,知道排好序为止
 

 
 1️⃣.从第一个元素开始，默认为第一个元素是已经被排序的
 2️⃣.取出下一个元素，在已排序的序列中从后向前扫描
 3️⃣.如果该元素大于取出元素，则向后挪动
 4️⃣.重复步骤3 直到在已排序好的序列中找到小于或等于取出的元素的位置
 5️⃣.将取出的元素插入带该元素的位置
 重复步骤 2~5
 
 时间复杂度 最好 O(n) 最坏 O(n^2)  平均O(n^2)
 空件复杂度 O(1)
 稳定性:✅
 In-place:✅
 
 最好情况,一个升序列表,每个元素都只需要判断一次,就好了O(n)
 最坏情况:一个倒叙列表,每个元素都需要判断n-1次 叠加起来,就是O(n^2)
 
 */
class InversionSort: BaseSort {
    override func sortAction() {
        for i in 1..<arrayList.count {
            var cur = i
            while cur > 0 && cmpIndex(cur, cur-1)<0 {
                swap(cur, cur-1)
                cur-=1
            }
        }
    }
}

//优化排序
class InversionSort1: BaseSort {
    override func sortAction() {
        for i in 1..<arrayList.count {
            var cur = i
            let v = arrayList[cur]
            while cur > 0 && cmpValue(v, arrayList[cur-1]) < 0 {
//                swap(cur, cur-1)
                //替换,不移动,swap方法有三行代码,优化后一行代码,
                arrayList[cur] = arrayList[cur-1]
                cur-=1
            }
            arrayList[cur] = v
        }
    }
}

//优化排序
//二分法查找优化
//省去与每一个元素对比 直接插入要插入的位置
class InversionSort2: BaseSort {
    
    override func sortAction() {
        for i in 1..<arrayList.count {
            insert(source: i, dest: search(index: i))
        }
    }
    
    /// 插入位置
    /// - Parameters:
    ///   - source: 原来位置
    ///   - dest: 插入的位置
    func insert(source:Int,dest:Int) {
        //先保存要插入的元素
        let v = arrayList[source]
        var i = source
        //如果i<dest说明目标位置已经大于排好序的位置的最大值, 相当于不需要插入,
        while i>dest {
            //相当于插入的位置元素后面的所有元素依次往后移一位
            arrayList[i] = arrayList[i-1]
            //循环
            i-=1
        }
        //最后吧目标位置存入要插入的元素v
        arrayList[dest] = v
    }
    
    /// 搜索到要插入的位置
    /// - Parameter index: 目标元素
    /// - Returns: 返回要插入的位置
    func search(index:Int)-> Int{
        var start = 0
        var end = index
        while start < end {
            //找到中间位置
            let mid = (end - start) >> 1 + start
            //比中间位置小说明在(start,mid)位置中,继续查找
            if cmpIndex(index, mid) < 0{
                end = mid
                
            }else{
                //否则就在(mid+1,end)位置中
                start = mid+1
            }
        }
        //直到时start或end就是要插入的位置
        return start
    }
}


