//
//  SidePhne.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/23/21.
//

import SwiftUI

struct SidePhneView: View {
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        VStack {
            Text("Side Phne View")
                .frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
            Divider()
        }
        .frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
    }
}

struct SidePhneView_Previews: PreviewProvider {
    static var previews: some View {
        SidePhneView(width: 250, height: 300)
    }
}
