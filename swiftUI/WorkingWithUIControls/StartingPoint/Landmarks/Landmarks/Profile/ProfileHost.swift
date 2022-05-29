//
//  ProfileHost.swift
//  Landmarks
//
//  Created by wanggang on 2022/5/29.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State var draftProfie = Profile.default
    var body: some View {
        Text("Profile for :\(draftProfie.username)")
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
