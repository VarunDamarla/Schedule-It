import UIKit
import FSCalendar

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var calendar: FSCalendar!

    var events = [MyEvent]()
    var filteredEvents = [MyEvent]()
	var selectedDate = Date()
    var selected = false
    var errorMessage = "No events today!"
    let formatter = DateFormatter()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        table.delegate = self
        table.dataSource = self
        formatter.dateFormat = "MMM, dd, YYYY"
	}

    @IBAction func didTapAdd() {
        
        let addMenu = storyboard!.instantiateViewController(identifier: "add") as! AddViewController
        
        addMenu.title = "New Event"
        addMenu.completion = { title, body, startDate, endDate in DispatchQueue.main.async {
            self.navigationController?.popToRootViewController(animated: true)
            let new = MyEvent(title: title, startDate: startDate, endDate: endDate, identifier: "id_\(title)")
                self.events.append(new)
            }
        }
        navigationController?.pushViewController(addMenu, animated: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selected = true
        print("checkpoint 1", filteredEvents.count)
        selectedDate = date
        let selectedDateStr = formatter.string(from: selectedDate)
        for event in events {
            if selectedDateStr == formatter.string(from: event.startDate) {
                filteredEvents.append(event)
            }
        }
        for event in filteredEvents {
            print(event.title, formatter.string(from: event.startDate), formatter.string(from: event.endDate))
        }
        self.table.reloadData()
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        filteredEvents.removeAll()
        self.table.reloadData()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var date = Date()
        var cellText = ""
        var detailText = ""
        
        if (selected && filteredEvents.count != 0) {
            print(filteredEvents.count)
            cellText = filteredEvents[indexPath.row].title
            date = filteredEvents[indexPath.row].startDate
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
