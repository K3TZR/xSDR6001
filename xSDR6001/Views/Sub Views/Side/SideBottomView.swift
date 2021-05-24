//
//  SideBottomView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/23/21.
//

import SwiftUI

struct SideBottomView: View {
    let width: CGFloat
    let height: CGFloat

    @AppStorage("showRx") var showRx = false
    @AppStorage("showTx") var showTx = false
    @AppStorage("showPcw") var showPcw = false
    @AppStorage("showPhne") var showPhne = false
    @AppStorage("showEq") var showEq = false

    var body: some View {
        VStack {
            Divider()
            ScrollView([.vertical]) {
                if showRx { SideRxView(width: width, height: height) }
                if showTx { SideTxView(width: width, height: height) }
                if showPcw { SidePcwView(width: width, height: height) }
                if showPhne { SidePhneView(width: width, height: height) }
                if showEq { SideEqView(width: width, height: height) }
            }
        }
        .frame(minWidth: width, maxWidth: width, minHeight: 0, maxHeight: .infinity)
    }
}

struct SideBottomView_Previews: PreviewProvider {
    static var previews: some View {
        SideBottomView(width: 250, height: 300)
    }
}
