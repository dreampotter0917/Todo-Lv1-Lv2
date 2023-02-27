//
//  TodoItem.swift
//  Todo
//
//  Created by あらいゆめ on 2023/02/23.
//

import Foundation
import RealmSwift

class TodoItem: Object{
    @Persisted var title: String = ""
    @Persisted var content: String = ""
    @Persisted var deadline: Date = Date()
    
    
    
}
