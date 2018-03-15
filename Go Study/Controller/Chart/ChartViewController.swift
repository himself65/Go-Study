//
//  ChartViewController.swift
//  Go Study
//
//  Created by Himself65 on 2018/2/25.
//  Copyright © 2018年 Himself65. All rights reserved.
//

import UIKit
import os.log


class ChartViewController: SuperViewController {
    
    
    var chartView: AAChartView = AAChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.topViewController?.title = "近期情况"
        self.initChart()
        self.loadChartData()
    }
    
    private func initChart() {
        let chartViewWidth: CGFloat  = self.view.frame.size.width;
        let chartViewHeight: CGFloat = self.view.frame.size.height;
        chartView.frame = CGRect(x: 0, y: 0, width: chartViewWidth, height: chartViewHeight)
        self.view.addSubview(chartView)
        // INIT
        
        chartView.scrollEnabled = false;
    }
    private func loadChartData() {
        let chartModel = AAChartModel.init()
            .animationType(.EaseInCirc)
            .backgroundColor("#333366")
            .dataLabelEnabled(false)
            .chartType(AAChartType.AreaSpline)
            .yAxisTitle("累计时间")
            .yAxisVisible(true)
            .xAxisVisible(true)
            .legendEnabled(false)   // buttom of view
            .colorsTheme(["#99cc33"])   // theme of view
            .series([
                [
                    "name": "总分钟数",
                    "data": [1.0,2.0,10.0,15.0,7.0,4.0,6.0,19.0]
                ]
                ])
        chartView.aa_drawChartWithChartModel(chartModel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Do Nothing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
