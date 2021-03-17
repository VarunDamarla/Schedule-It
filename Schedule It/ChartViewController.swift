//
//  ChartViewController.swift
//  Schedule It
//
//  Created by VarunDamarla on 3/01/21.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet var chart: PieChartView!
    
    var counts = [Int]()
    var strDates = [String]()
    
    // Data Entries for the Pie Chart
    var zeroethHrDataEntry = PieChartDataEntry(value: 0)
    var firstHrDataEntry = PieChartDataEntry(value: 0)
    var secondHrDataEntry = PieChartDataEntry(value: 0)
    var thirdHrDataEntry = PieChartDataEntry(value: 0)
    var fourthHrDataEntry = PieChartDataEntry(value: 0)
    var fifthHrDataEntry = PieChartDataEntry(value: 0)
    var sixthHrDataEntry = PieChartDataEntry(value: 0)
    var seventhHrDataEntry = PieChartDataEntry(value: 0)
    var eighthHrDataEntry = PieChartDataEntry(value: 0)
    var ninthHrDataEntry = PieChartDataEntry(value: 0)
    var tenthHrDataEntry = PieChartDataEntry(value: 0)
    var eleventhHrDataEntry = PieChartDataEntry(value: 0)
    var twelfthHrDataEntry = PieChartDataEntry(value: 0)
    var thirteenthHrDataEntry = PieChartDataEntry(value: 0)
    var fourteenthHrDataEntry = PieChartDataEntry(value: 0)
    var fifteenthHrDataEntry = PieChartDataEntry(value: 0)
    var sixteenthHrDataEntry = PieChartDataEntry(value: 0)
    var seventeenthHrDataEntry = PieChartDataEntry(value: 0)
    var eighteenthHrDataEntry = PieChartDataEntry(value: 0)
    var nineteenthHrDataEntry = PieChartDataEntry(value: 0)
    var twentiethHrDataEntry = PieChartDataEntry(value: 0)
    var twentyFirstHrDataEntry = PieChartDataEntry(value: 0)
    var twentySecondHrDataEntry = PieChartDataEntry(value: 0)
    var twentyThirdHrDataEntry = PieChartDataEntry(value: 0)
    var allDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chart.chartDescription?.text = "Chart View"
        
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
        zeroethHrDataEntry.label = "12:00AM"
        firstHrDataEntry.label = "1:00AM"
        secondHrDataEntry.label = "2:00AM"
        thirdHrDataEntry.label = "3:00AM"
        fourthHrDataEntry.label = "4:00AM"
        fifthHrDataEntry.label = "5:00AM"
        sixthHrDataEntry.label = "6:00AM"
        seventhHrDataEntry.label = "7:00AM"
        eighthHrDataEntry.label = "8:00AM"
        ninthHrDataEntry.label = "9:00AM"
        tenthHrDataEntry.label = "10:00AM"
        eleventhHrDataEntry.label = "11:00AM"
        twelfthHrDataEntry.label = "12:00PM"
        thirteenthHrDataEntry.label = "1:00PM"
        fourteenthHrDataEntry.label = "2:00PM"
        fifteenthHrDataEntry.label = "3:00PM"
        sixteenthHrDataEntry.label = "4:00PM"
        seventeenthHrDataEntry.label = "5:00PM"
        eighteenthHrDataEntry.label = "6:00PM"
        nineteenthHrDataEntry.label = "7:00PM"
        twentiethHrDataEntry.label = "8:00PM"
        twentyFirstHrDataEntry.label = "9:00PM"
        twentySecondHrDataEntry.label = "10:00PM"
        twentyThirdHrDataEntry.label = "11:00PM"
        
        // Updating all the entries
        allDataEntries = [zeroethHrDataEntry, firstHrDataEntry, secondHrDataEntry, thirdHrDataEntry, fourthHrDataEntry, fifthHrDataEntry, sixthHrDataEntry, seventhHrDataEntry, eighthHrDataEntry, ninthHrDataEntry, tenthHrDataEntry, eleventhHrDataEntry, twelfthHrDataEntry, thirteenthHrDataEntry, fourteenthHrDataEntry, fifteenthHrDataEntry, sixteenthHrDataEntry, seventeenthHrDataEntry, eighteenthHrDataEntry, nineteenthHrDataEntry, twentiethHrDataEntry, twentyFirstHrDataEntry, twentySecondHrDataEntry, twentyThirdHrDataEntry]
        
        updateChartData()
        
        chart.delegate = self
    }
    
    
    func calculate(events: [MyEvent]) {
        counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
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
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: allDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "zeroethHr"), UIColor(named: "firstHr"), UIColor(named: "secondHr"), UIColor(named: "thirdHr"), UIColor(named: "fourthHr"), UIColor(named: "fifthHr"), UIColor(named: "sixthHr"), UIColor(named: "seventhHr"), UIColor(named: "eighthHr"), UIColor(named: "ninthHr"), UIColor(named: "tenthHr"), UIColor(named: "eleventhHr"), UIColor(named: "twelfthHr"), UIColor(named: "thirteenthHr"), UIColor(named: "fourteenthHr"), UIColor(named: "fifteenthHr"), UIColor(named: "sixteenthHr"), UIColor(named: "seventeenthHr"), UIColor(named: "eighteenthHr"), UIColor(named: "nineteenthHr"), UIColor(named: "twentiethHr"), UIColor(named: "twentyFirstHr"), UIColor(named: "twentySecondHr"), UIColor(named: "twentyThirdHr")]
        
        chartDataSet.colors = colors as [NSUIColor]
        
        chart.data = chartData
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     
        
    

}
