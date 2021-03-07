//
//  AddEventMenu.swift
//  Schedule It
//
//  Created by VarunDamarla on 3/7/21.
//

import UIKit

class AddEventMenu: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var notesField: UITextField!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    
    public var completion: ((String, String, Date, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        notesField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    }

    @objc func didTapSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
            let bodyText = notesField.text, !bodyText.isEmpty {

            let startTargetDate = startDatePicker.date
            let endTargetDate = endDatePicker.date

            completion?(titleText, bodyText, startTargetDate, endTargetDate)

        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
