//
//  ChartViewController.swift
//  Schedule It
//
//  Created by VarunDamarla on 2/01/21.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var table: UITableView!
    @IBOutlet var calendar: FSCalendar!
    
    private var database = [Task]()

    public var tasks: [Task] {
        get {
            guard let date = selectedDate else { return [] }
            return database.filter {
                Calendar.current.isDate(date, inSameDayAs: $0.date!)
            }
        }
    }
    public var selectedDate: Date? = Date()
    public let formatter = DateFormatter()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
        getAllItems()
        calendar.delegate = self
        calendar.dataSource = self
        table.delegate = self
        table.dataSource = self
        formatter.dateFormat = "MMM d, h:mm a"
	}
    
    @IBAction func didTapAdd() {
        
        let addMenu = storyboard!.instantiateViewController(identifier: "add") as AddTaskViewController
        addMenu.title = "New Event"
        addMenu.completion = { title, body, date in DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                self.createItem(name: title, date: date)
                self.table.reloadData()
            }
        }
        navigationController?.pushViewController(addMenu, animated: true)
    }
    
    @IBAction func didTapChartView() {
        let chartMenu = storyboard!.instantiateViewController(identifier: "chart") as ChartViewController
        self.navigationController?.popViewController(animated: true)
        chartMenu.title = "Chart View"
        chartMenu.calculate(events: tasks)
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
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var date = Date()
        var cellText = ""
        var detailText = ""
        
        if (tasks.count != 0) {
            cellText = tasks[indexPath.row].name!
            date = tasks[indexPath.row].date!
            detailText = formatter.string(from: date)
        }
        
        cell.textLabel?.text = cellText
        cell.detailTextLabel?.text = detailText
        cell.textLabel?.font = UIFont(name: "Arial", size: 25)
        cell.detailTextLabel?.font = UIFont(name: "Arial", size: 18)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let task = tasks[indexPath.row]
        let options = UIAlertController(title: "Edit Task", message: nil, preferredStyle: .actionSheet)
        options.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        options.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let subOptions = UIAlertController(title: "Edit Options", message: nil, preferredStyle: .actionSheet)
            subOptions.addAction(UIAlertAction(title: "Edit name", style: .default, handler: { _ in
                
                let nameEditor = UIAlertController(title: "Edit Name", message: "", preferredStyle: .alert)
                nameEditor.addTextField(configurationHandler: nil)
                nameEditor.textFields?.first?.text = task.name
                
                nameEditor.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
                    guard let field = nameEditor.textFields?.first, let newName = field.text, !newName.isEmpty else {
                        return
                    }
                    self?.updateItemName(item: task, newName: newName)
                }))
                
                self.present(nameEditor, animated: true)
                
            }))
             
            
            subOptions.addAction(UIAlertAction(title: "Edit date", style: .default, handler: { _ in
                
                let dateEditor = UIAlertController(title: "Edit Name", message: "Example entry: Mar 19, 2021 1:05 PM", preferredStyle: .alert)
                
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM d, yyyy h:mm a"
                
                dateEditor.addTextField(configurationHandler: nil)
                let dateText = dateEditor.textFields?.first?.text
                task.date = formatter.date(from: dateText!)
                
                dateEditor.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
                    guard let field = dateEditor.textFields?.first, let newDate = formatter.date(from: field.text!), !(field.text)!.isEmpty  else {
                        return
                    }
                    self?.updateItemDate(item: task, newDate: newDate)
                }))
                
                self.present(dateEditor, animated: true)
                
            }))
            
            
            self.present(subOptions, animated: true)
        }))
        
        
        options.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.deleteItem(item: task)
        }))
        present(options, animated: true)
    }
    
    func getAllItems() {
        do {
            database = try context.fetch(Task.fetchRequest())
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        } catch {
            // error
        }
        
    }
    
    func createItem(name: String, date: Date) {
        let newItem = Task(context: context)
        newItem.name = name
        newItem.date = date
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    func deleteItem(item: Task) {
        context.delete(item)
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    func updateItemName(item: Task, newName: String) {
        item.name = newName
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    func updateItemDate(item: Task, newDate: Date) {
        item.date = newDate
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
}
