//
//  AddViewController.swift
//  MyReminders
//
//  Created by Afraz Siddiqui on 3/20/20.
//  Copyright © 2020 ASN GROUP LLC. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!

    public var completion: ((String, String, Date, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        bodyField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    }

    @objc func didTapSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
            let bodyText = bodyField.text, !bodyText.isEmpty {

            let targetDate = datePicker.date
            let endTargetDate = endDatePicker.date

            completion?(titleText, bodyText, targetDate, endTargetDate)

        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
