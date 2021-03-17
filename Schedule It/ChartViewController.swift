//
//  ChartViewController.swift
//  Schedule It
//
//  Created by VarunDamarla on 3/01/21.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {
    
    var chart = PieChartView()
    
    var counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var strDates = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chart.delegate = self
    }
    
    
    func calculate(events: [MyEvent]) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        var i: Int = 0
        for event in events {
            i = 0
            if (formatter.string(from: event.startDate).contains("1:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 1
            } else if (formatter.string(from: event.startDate).contains("2:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 2
            } else if (formatter.string(from: event.startDate).contains("3:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 3
            } else if (formatter.string(from: event.startDate).contains("4:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 4
            } else if (formatter.string(from: event.startDate).contains("5:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 5
            } else if (formatter.string(from: event.startDate).contains("6:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 6
            } else if (formatter.string(from: event.startDate).contains("7:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 7
            } else if (formatter.string(from: event.startDate).contains("8:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 8
            } else if (formatter.string(from: event.startDate).contains("9:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 9
            } else if (formatter.string(from: event.startDate).contains("10:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 10
            } else if (formatter.string(from: event.startDate).contains("11:") && formatter.string(from: event.startDate).contains("AM")) {
                i = 11
            } else if (formatter.string(from: event.startDate).contains("12:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 12
            } else if (formatter.string(from: event.startDate).contains("1:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 13
            } else if (formatter.string(from: event.startDate).contains("2:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 14
            } else if (formatter.string(from: event.startDate).contains("3:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 15
            } else if (formatter.string(from: event.startDate).contains("4:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 16
            } else if (formatter.string(from: event.startDate).contains("5:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 17
            } else if (formatter.string(from: event.startDate).contains("6:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 18
            } else if (formatter.string(from: event.startDate).contains("7:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 19
            } else if (formatter.string(from: event.startDate).contains("8:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 20
            } else if (formatter.string(from: event.startDate).contains("9:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 21
            } else if (formatter.string(from: event.startDate).contains("10:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 22
            } else if (formatter.string(from: event.startDate).contains("11:") && formatter.string(from: event.startDate).contains("PM")) {
                i = 23
            }
            counts[i] += 1
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        chart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        view.addSubview(chart)
        
        var entries = [ChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        chart.data = data
        
    }

     
        
    

}
