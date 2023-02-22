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

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'年'M'月'd'日('EEEEE') '"
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        let deadline = dateFormatter.string(from: deadlineDatePicker.date)

        item.deadline = deadline
        
        createItem(item: item)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func createItem(item: TodoItem){
        try! realm.write {
            realm.add(item)
        }
    }
    


}
