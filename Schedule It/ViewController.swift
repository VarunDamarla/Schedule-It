import UIKit
import UserNotifications

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	@IBOutlet weak var monthLabel: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var table: UITableView!

    var models = [MyEvent]()
	
	var selectedDate = Date()
	var totalSquares = [String]()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setCellsView()
		setMonthView()
        table.delegate = self
        table.dataSource = self
	}
	
	func setCellsView() {
		let width = (collectionView.frame.size.width - 2) / 8
		let height = (collectionView.frame.size.height - 2) / 8
		
		let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		flowLayout.itemSize = CGSize(width: width, height: height)
	}
	
	func setMonthView() {
		totalSquares.removeAll()
		
		let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
		let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
		let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
		
		var count: Int = 1
		
		while(count <= 42) {
			if(count <= startingSpaces || count - startingSpaces > daysInMonth) {
				totalSquares.append("")
			}
			else {
				totalSquares.append(String(count - startingSpaces))
			}
			count += 1
		}
		
		monthLabel.text = CalendarHelper().monthString(date: selectedDate)
			+ " " + CalendarHelper().yearString(date: selectedDate)
		collectionView.reloadData()
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		totalSquares.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
		
		cell.dayOfMonth.text = totalSquares[indexPath.item]
		
		return cell
	}
	
	@IBAction func previousMonth(_ sender: Any) {
		selectedDate = CalendarHelper().minusMonth(date: selectedDate)
		setMonthView()
	}
	
	@IBAction func nextMonth(_ sender: Any) {
		selectedDate = CalendarHelper().plusMonth(date: selectedDate)
		setMonthView()
	}
	
	override open var shouldAutorotate: Bool {
		return false
	}
    
    
    @IBAction func didTapAdd() {
        
        let vc = storyboard!.instantiateViewController(identifier: "add") as! AddViewController
        
        vc.title = "New Event"
        vc.completion = { title, body, startDate, endDate in
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let new = MyEvent(title: title, startDate: startDate, endDate: endDate, identifier: "id_\(title)")
                self.models.append(new)
                self.table.reloadData()
                
                print("checkpoint 3")

                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body

                let targetDate = startDate
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                                                                          from: targetDate),
                                                            repeats: false)

                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    if error != nil {
                        print("something went wrong")
                    }
                })
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}
 

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


extension ViewController: UITableViewDataSource {

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
