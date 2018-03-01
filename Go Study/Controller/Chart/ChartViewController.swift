//
//  ChartViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/25.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import Charts

private class CubicLineSampleFillFormatter: IFillFormatter {
    func getFillLinePosition(dataSet: ILineChartDataSet, dataProvider: LineChartDataProvider) -> CGFloat {
        return -10
    }
}

class ChartViewController: UIViewController {
    
    @IBOutlet weak var chart: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initChart()
        loadChartData(45, range: 100)
        if chart.data == nil {
            self.noticeTop("没有数据", autoClear: true, autoClearTime: 2)
        }
        // TEST
        print(chart.isDrawGridBackgroundEnabled)
    }
    
    private func initChart() {
        chart.dragEnabled = false
        chart.chartDescription?.text = "统计"
        chart.noDataText = "你还没有可展示的数据"
        
        // chart's background
        chart.drawGridBackgroundEnabled = true
        chart.drawBordersEnabled = false
        chart.gridBackgroundColor = UIColor(red: 179/255, green: 125/255, blue: 108/255, alpha: 1)
        
        // 不显示右面轴
        chart.rightAxis.drawAxisLineEnabled = false
        chart.rightAxis.enabled = false
        
        // 禁止缩放
        chart.scaleXEnabled = false
        chart.scaleYEnabled = false
        
        chart.animate(xAxisDuration: 3)
    }
    
    private func loadChartData(_ count: Int, range: UInt32) {
        // 随机数据 TODO
        let yVals1 = (0..<count).map { (i) -> ChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(mult) + 20)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set = LineChartDataSet(values: yVals1, label: nil)
        set.mode = .cubicBezier
        set.drawCirclesEnabled = false
        set.highlightEnabled = false
        set.drawValuesEnabled = false
        
        set.colors = [.white]
        set.fillColor = .white
        
        set.fillAlpha = 1
        set.lineWidth = 1.0
        
        let data = LineChartData(dataSet: set)
        chart.data = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Do Nothing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
