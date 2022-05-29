//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by wanggang on 2022/5/29.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username",text:$profile.username)
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Eanble Notificatios")
            }
            VStack (alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                DatePicker(
                    "Goal Date",
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date)
            }.padding(.top)
        }
     
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
