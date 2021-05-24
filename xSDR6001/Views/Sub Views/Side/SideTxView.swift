//
//  SideTx.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/23/21.
//

import SwiftUI

struct SideTxView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            Text("Side Tx View")
                .frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
            Divider()
        }
        .frame(minWidth: width, maxWidth: width, minHeight: height, maxHeight: height)
    }
}

struct SideTxView_Previews: PreviewProvider {
    static var previews: some View {
        SideTxView(width: 250, height: 300)
    }
}
