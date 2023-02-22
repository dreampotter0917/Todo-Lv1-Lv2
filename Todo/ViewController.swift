//
//  ViewController.swift
//  Todo
//
//  Created by あらいゆめ on 2023/02/22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController , UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var items:[TodoItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for:indexPath) as! ItemTableViewCell
        let item:TodoItem = items[indexPath.row]
        cell.setCell(title: item.title, content: item.content, deadline: item.deadline)
        
        return cell
    }

    func readItems() -> [TodoItem]{
        return Array(realm.objects(TodoItem.self))
    }

}


extension ViewController: UITableViewDelegate {
  // スワイプした時に表示するアクションの定義
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

    // 編集処理
    let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
      // 編集処理を記述
      print("Editがタップされた")

    // 実行結果に関わらず記述
    completionHandler(true)
    }

   // 削除処理
      let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completionHandler) in
      //削除処理を記述
        
        try! self.realm.write {
            let item = items.remove(at: indexPath.row)
                       realm.delete(item)
                   }
          tableView.reloadData()
      print("Deleteがタップされた")

      // 実行結果に関わらず記述
      completionHandler(true)
    }

    // 定義したアクションをセット
    return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
  }
}


