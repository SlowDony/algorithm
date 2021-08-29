//
//  ViewController.swift
//  Sort
//
//  Created by slowdony on 2021/8/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let randomArr = BaseSort.createRandom(count: 30, min: 0, max: 30)
        let sortArr = BaseSort.careatSort(min: 0, max: 1000)
//        print("randomArr:\(randomArr)")
        BaseSort.testSorts(array: sortArr,QuickSort1(),QuickSort3())
    }
}

