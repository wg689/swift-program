//
//  Candy.swift
//  CandySearch
//
//  Created by  汪刚 on 2018/9/16.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import UIKit

class Candy: NSObject {
    var category :String
    var name : String
    init(category: String ,name: String) {
        self.category = category
        self.name = name
    }
}
