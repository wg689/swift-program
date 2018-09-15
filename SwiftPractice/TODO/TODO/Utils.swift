//
//  Utils.swift
//  TODO
//
//  Created by  汪刚 on 2018/9/8.
//  Copyright © 2018年  汪刚. All rights reserved.
//

import Foundation

func dataFromString(_ date:String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: date )
}

func stringFromDate(_ date: Date ) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}

