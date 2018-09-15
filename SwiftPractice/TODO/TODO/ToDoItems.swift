//
//  ToDoItems.swift
//  TODO
//
//  Created by  汪刚 on 2018/9/8.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var id: String
    var image: String
    var title :String
    var date: Date
    init(id:String,image: String,title:String,date:Date) {
        self.id = id;
        self.image = image
        self.title = title
        self.date = date
    }
}
