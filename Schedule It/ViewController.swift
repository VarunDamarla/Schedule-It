//
//  ChartViewController.swift
//  Schedule It
//
//  Created by VarunDamarla on 2/01/21.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var calendar: FSCalendar!
    
    var database: [MyEvent] = []

    public var events: [MyEvent] {
        get {
            guard let date = selectedDate else { return [] }
            return database.filter {
                Calendar.current.isDate(date, inSameDayAs: $0.startDate) || ($0.startDate...$0.endDate).contains(date)
            }
        }
    }
    public var selectedDate: Date? = Date()
    public let formatter = DateFormatter()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        table.delegate = self
        table.dataSource = self
        formatter.dateFormat = "MMM d, h:mm a"
	}
    
    @IBAction func didTapAdd() {
        
        let addMenu = storyboard!.instantiateViewController(identifier: "add") as AddEventViewController
        
        addMenu.title = "New Event"
        addMenu.completion = { title, body, startDate, endDate in DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let new = MyEvent(title: title, startDate: startDate, endDate: endDate, identifier: "id_\(title)")
                self.database.append(new)
                self.table.reloadData()
            }
        }
        navigationController?.pushViewController(addMenu, animated: true)
        
    }
    
    @IBAction func didTapChartView() {
        let chartMenu = storyboard!.instantiateViewController(identifier: "chart") as ChartViewController
        self.navigationController?.popViewController(animated: true)
        chartMenu.title = "Chart View"
        chartMenu.calculate(events: events)
        navigationController?.pushViewController(chartMenu, animated: true)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = date
        self.table.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.selectedDate = nil
        self.table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var date = Date()
        var cellText = ""
        var detailText = ""
        
        if (events.count != 0) {
            cellText = events[indexPath.row].title
            date = events[indexPath.row].startDate
            detailText = formatter.string(from: date)
        }
        
        cell.textLabel?.text = cellText
        cell.detailTextLabel?.text = detailText
        cell.textLabel?.font = UIFont(name: "Arial", size: 25)
        cell.detailTextLabel?.font = UIFont(name: "Arial", size: 22)
        
        return cell
    }
}

struct MyEvent {
    let title: String
    let startDate: Date
    let endDate: Date
    let identifier: String
}
