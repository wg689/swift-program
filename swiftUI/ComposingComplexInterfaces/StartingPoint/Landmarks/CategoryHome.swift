//
//  CategoryHome.swift
//  Landmarks
//
//  Created by wanggang on 2022/5/29.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categoryName: String
    
    var categories:[String: [Landmark]] {
        Dictionary(
            grouping: landmarkData, by:
                { $0.category.rawValue }
        )
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(categories.keys.sorted(),id:\.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
            }.navigationBarTitle(Text("Featured"))
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome(categoryName:"1223")
    }
}
