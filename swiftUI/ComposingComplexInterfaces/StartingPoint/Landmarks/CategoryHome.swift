//
//  CategoryHome.swift
//  Landmarks
//
//  Created by wanggang on 2022/5/29.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
//    var categoryName: String
    
    var categories:[String: [Landmark]] {
        Dictionary(
            grouping: landmarkData, by:
                { $0.category.rawValue }
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter{$0.isFeatured}
    }
 
    @State var showingProfile = true
    
    var profileButton: some View {
        Button(action:{self.showingProfile.toggle()}) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profiel"))
                .padding()
        }
    }
    
    
    var body: some View {
        NavigationView {
            List{
                //
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFit()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                //
                ForEach(categories.keys.sorted(),id:\.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                
                //
                NavigationLink(destination: LandmarkList()) {
                    Text("See All")
                }
                
                
            }.navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile){
                Text("USer Profile")
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
