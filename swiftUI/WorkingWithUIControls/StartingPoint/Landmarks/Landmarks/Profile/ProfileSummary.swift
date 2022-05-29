//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by wanggang on 2022/5/29.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notification: \(self.profile.prefersNotifications ? "on" : "off")")
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                                    .font(.headline)
                
                ScrollView {
                    HStack {
                        HikeBadge(name: "first hike")
                        
                        HikeBadge(name: "Early day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenc Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 90))
                    }
                }
                .frame(height: 140)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
