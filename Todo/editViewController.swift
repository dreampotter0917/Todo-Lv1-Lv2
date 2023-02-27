//
//  editViewController.swift
//  Todo
//
//  Created by あらいゆめ on 2023/02/25.
//

import UIKit
import RealmSwift

    
    class editViewController: UIViewController {
        
        @IBOutlet var titleTextField: UITextField!
        @IBOutlet var contentTextField: UITextField!
        @IBOutlet var deadlineDatePicker: UIDatePicker!
        
        //todoItemを受け渡す,受ける側
        var editCategory: TodoItem!
        
        let realm = try! Realm()
        
        override func viewWillAppear(_ animated: Bool) {
            titleTextField.text = editCategory.title
            contentTextField.text = editCategory.content
            deadlineDatePicker.setDate(editCategory.deadline, animated: false)
        }

        override func viewDidLoad() {
            super.viewDidLoad()


        }
        
        @IBAction func save(){
            let item = TodoItem()
            item.title = titleTextField.text ?? ""
            item.content = contentTextField.text ?? ""
            item.deadline = deadlineDatePicker.date
            
            getItem(item: item)
            
            self.navigationController?.popViewController(animated: true)
        }
        
        func getItem(item: TodoItem){
            try! realm.write {
                editCategory.title = item.title
                editCategory.content = item.content
                editCategory.deadline = item.deadline
            }
        }
        
        

    }




