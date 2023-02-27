//
//  NewTodoViewController.swift
//  Todo
//
//  Created by あらいゆめ on 2023/02/23.
//

import UIKit
import RealmSwift

class NewTodoViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var deadlineDatePicker: UIDatePicker!
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(){
        let item = TodoItem()
        item.title = titleTextField.text ?? ""
        item.content = contentTextField.text ?? ""
        item.deadline = deadlineDatePicker.date
        
        createItem(item: item)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func createItem(item: TodoItem){
        try! realm.write {
            realm.add(item)
        }
    }
    


}
