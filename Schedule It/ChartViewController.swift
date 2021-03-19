//
//  ChartViewController.swift
//  Schedule It
//
//  Created by VarunDamarla on 3/01/21.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    
    @IBOutlet var chart: PieChartView!
    
    var counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var strDates = [String]()
    
    // Data Entries for the Pie Chart
    var zeroethHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var firstHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var secondHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var thirdHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var fourthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var fifthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var sixthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var seventhHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var eighthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var ninthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var tenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var eleventhHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var twelfthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var thirteenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var fourteenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var fifteenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var sixteenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var seventeenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var eighteenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var nineteenthHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var twentiethHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var twentyFirstHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var twentySecondHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var twentyThirdHrDataEntry = PieChartDataEntry(value: 0, label: "")
    var allDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up the values
        zeroethHrDataEntry.value = Double(counts[0])
        firstHrDataEntry.value = Double(counts[1])
        secondHrDataEntry.value = Double(counts[2])
        thirdHrDataEntry.value = Double(counts[3])
        fourthHrDataEntry.value = Double(counts[4])
        fifthHrDataEntry.value = Double(counts[5])
        sixthHrDataEntry.value = Double(counts[6])
        seventhHrDataEntry.value = Double(counts[7])
        eighthHrDataEntry.value = Double(counts[8])
        ninthHrDataEntry.value = Double(counts[9])
        tenthHrDataEntry.value = Double(counts[10])
        eleventhHrDataEntry.value = Double(counts[11])
        twelfthHrDataEntry.value = Double(counts[12])
        thirteenthHrDataEntry.value = Double(counts[13])
        fourteenthHrDataEntry.value = Double(counts[14])
        fifteenthHrDataEntry.value = Double(counts[15])
        sixteenthHrDataEntry.value = Double(counts[16])
        seventeenthHrDataEntry.value = Double(counts[17])
        eighteenthHrDataEntry.value = Double(counts[18])
        nineteenthHrDataEntry.value = Double(counts[19])
        twentiethHrDataEntry.value = Double(counts[20])
        twentyFirstHrDataEntry.value = Double(counts[21])
        twentySecondHrDataEntry.value = Double(counts[22])
        twentyThirdHrDataEntry.value = Double(counts[23])
        
        // Setting up the labels
        if counts[0] > 0 { zeroethHrDataEntry.label = "12:00AM" }
        if counts[1] > 0 { firstHrDataEntry.label = "1:00AM" }
        if counts[2] > 0 { secondHrDataEntry.label = "2:00AM" }
        if counts[3] > 0 { thirdHrDataEntry.label = "3:00AM" }
        if counts[4] > 0 { fourthHrDataEntry.label = "4:00AM" }
        if counts[5] > 0 { fifthHrDataEntry.label = "5:00AM" }
        if counts[6] > 0 { sixthHrDataEntry.label = "6:00AM" }
        if counts[7] > 0 { seventhHrDataEntry.label = "7:00AM" }
        if counts[8] > 0 { eighthHrDataEntry.label = "8:00AM" }
        if counts[9] > 0 { ninthHrDataEntry.label = "9:00AM" }
        if counts[10] > 0 { tenthHrDataEntry.label = "10:00AM" }
        if counts[11] > 0 { eleventhHrDataEntry.label = "11:00AM" }
        if counts[12] > 0 { twelfthHrDataEntry.label = "12:00PM" }
        if counts[13] > 0 { thirteenthHrDataEntry.label = "1:00PM" }
        if counts[14] > 0 { fourteenthHrDataEntry.label = "2:00PM" }
        if counts[15] > 0 { fifteenthHrDataEntry.label = "3:00PM" }
        if counts[16] > 0 { sixteenthHrDataEntry.label = "4:00PM" }
        if counts[17] > 0 { seventeenthHrDataEntry.label = "5:00PM" }
        if counts[18] > 0 { eighteenthHrDataEntry.label = "6:00PM" }
        if counts[19] > 0 { nineteenthHrDataEntry.label = "7:00PM" }
        if counts[20] > 0 { twentiethHrDataEntry.label = "8:00PM" }
        if counts[21] > 0 { twentyFirstHrDataEntry.label = "9:00PM" }
        if counts[22] > 0 { twentySecondHrDataEntry.label = "10:00PM" }
        if counts[23] > 1 { twentyThirdHrDataEntry.label = "11:00PM" }
        
        // Updating all the entries
        allDataEntries = [zeroethHrDataEntry, firstHrDataEntry, secondHrDataEntry, thirdHrDataEntry, fourthHrDataEntry, fifthHrDataEntry, sixthHrDataEntry, seventhHrDataEntry, eighthHrDataEntry, ninthHrDataEntry, tenthHrDataEntry, eleventhHrDataEntry, twelfthHrDataEntry, thirteenthHrDataEntry, fourteenthHrDataEntry, fifteenthHrDataEntry, sixteenthHrDataEntry, seventeenthHrDataEntry, eighteenthHrDataEntry, nineteenthHrDataEntry, twentiethHrDataEntry, twentyFirstHrDataEntry, twentySecondHrDataEntry, twentyThirdHrDataEntry]
        
        updateChartData()
        
    }
    
    
    func calculate(tasks: [Task]) {
        counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        var i: Int = 0
        for task in tasks {
            i = 0
            if (formatter.string(from: task.date!).contains("1:") && formatter.string(from: task.date!).contains("AM")) {
                i = 1
            } else if (formatter.string(from: task.date!).contains("2:") && formatter.string(from: task.date!).contains("AM")) {
                i = 2
            } else if (formatter.string(from: task.date!).contains("3:") && formatter.string(from: task.date!).contains("AM")) {
                i = 3
            } else if (formatter.string(from: task.date!).contains("4:") && formatter.string(from: task.date!).contains("AM")) {
                i = 4
            } else if (formatter.string(from: task.date!).contains("5:") && formatter.string(from: task.date!).contains("AM")) {
                i = 5
            } else if (formatter.string(from: task.date!).contains("6:") && formatter.string(from: task.date!).contains("AM")) {
                i = 6
            } else if (formatter.string(from: task.date!).contains("7:") && formatter.string(from: task.date!).contains("AM")) {
                i = 7
            } else if (formatter.string(from: task.date!).contains("8:") && formatter.string(from: task.date!).contains("AM")) {
                i = 8
            } else if (formatter.string(from: task.date!).contains("9:") && formatter.string(from: task.date!).contains("AM")) {
                i = 9
            } else if (formatter.string(from: task.date!).contains("10:") && formatter.string(from: task.date!).contains("AM")) {
                i = 10
            } else if (formatter.string(from: task.date!).contains("11:") && formatter.string(from: task.date!).contains("AM")) {
                i = 11
            } else if (formatter.string(from: task.date!).contains("12:") && formatter.string(from: task.date!).contains("PM")) {
                i = 12
            } else if (formatter.string(from: task.date!).contains("1:") && formatter.string(from: task.date!).contains("PM")) {
                i = 13
            } else if (formatter.string(from: task.date!).contains("2:") && formatter.string(from: task.date!).contains("PM")) {
                i = 14
            } else if (formatter.string(from: task.date!).contains("3:") && formatter.string(from: task.date!).contains("PM")) {
                i = 15
            } else if (formatter.string(from: task.date!).contains("4:") && formatter.string(from: task.date!).contains("PM")) {
                i = 16
            } else if (formatter.string(from: task.date!).contains("5:") && formatter.string(from: task.date!).contains("PM")) {
                i = 17
            } else if (formatter.string(from: task.date!).contains("6:") && formatter.string(from: task.date!).contains("PM")) {
                i = 18
            } else if (formatter.string(from: task.date!).contains("7:") && formatter.string(from: task.date!).contains("PM")) {
                i = 19
            } else if (formatter.string(from: task.date!).contains("8:") && formatter.string(from: task.date!).contains("PM")) {
                i = 20
            } else if (formatter.string(from: task.date!).contains("9:") && formatter.string(from: task.date!).contains("PM")) {
                i = 21
            } else if (formatter.string(from: task.date!).contains("10:") && formatter.string(from: task.date!).contains("PM")) {
                i = 22
            } else if (formatter.string(from: task.date!).contains("11:") && formatter.string(from: task.date!).contains("PM")) {
                i = 23
            }
            counts[i] += 1
        }
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: allDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "zeroethHr"), UIColor(named: "firstHr"), UIColor(named: "secondHr"), UIColor(named: "thirdHr"), UIColor(named: "fourthHr"), UIColor(named: "fifthHr"), UIColor(named: "sixthHr"), UIColor(named: "seventhHr"), UIColor(named: "eighthHr"), UIColor(named: "ninthHr"), UIColor(named: "tenthHr"), UIColor(named: "eleventhHr"), UIColor(named: "twelfthHr"), UIColor(named: "thirteenthHr"), UIColor(named: "fourteenthHr"), UIColor(named: "fifteenthHr"), UIColor(named: "sixteenthHr"), UIColor(named: "seventeenthHr"), UIColor(named: "eighteenthHr"), UIColor(named: "nineteenthHr"), UIColor(named: "twentiethHr"), UIColor(named: "twentyFirstHr"), UIColor(named: "twentySecondHr"), UIColor(named: "twentyThirdHr")]
        
        chartDataSet.colors = colors as! [NSUIColor]
        
        chart.data = chartData
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

 }
