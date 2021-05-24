//
//  Side.swift
//  xMini6001
//
//  Created by Douglas Adams on 5/13/21.
//

import SwiftUI

struct SideView: View {
//    let choices = ["Rx", "Tx", "P/Cw", "Phne", "Eq"]

    @AppStorage("showRx") var showRx = false
    @AppStorage("showTx") var showTx = false
    @AppStorage("showPcw") var showPcw = false
    @AppStorage("showPhne") var showPhne = false
    @AppStorage("showEq") var showEq = false

    let width: CGFloat = 250
    let height: CGFloat = 300

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button("Rx") {showRx.toggle()}.foregroundColor(showRx ? .accentColor : .secondary)
                Button("Tx") {showTx.toggle()}.foregroundColor(showTx ? .accentColor : .secondary)
                Button("P/Cw") {showPcw.toggle()}.foregroundColor(showPcw ? .accentColor : .secondary)
                Button("Phn") {showPhne.toggle()}.foregroundColor(showPhne ? .accentColor : .secondary)
                Button("Eq") {showEq.toggle()}.foregroundColor(showEq ? .accentColor : .secondary)
            }.padding(.vertical, 10)
            SideBottomView(width: width, height: height)
        }
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SideView()
    }
}
