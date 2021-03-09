import UIKit
import FSCalendar

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var calendar: FSCalendar!

    var models = [MyEvent]()
	
	var selectedDate = Date()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        table.delegate = self
        table.dataSource = self
	}
    
    // testing commit
    @IBAction func didTapAdd() {
        
        let vc = storyboard!.instantiateViewController(identifier: "add") as! AddViewController
        
        vc.title = "New Event"
        vc.completion = { title, body, startDate, endDate in DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let new = MyEvent(title: title, startDate: startDate, endDate: endDate, identifier: "id_\(title)")
                self.models.append(new)
                self.table.reloadData()
                print("checkpoint 3")
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        let date = models[indexPath.row].startDate

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, YYYY"
        cell.detailTextLabel?.text = formatter.string(from: date)

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
