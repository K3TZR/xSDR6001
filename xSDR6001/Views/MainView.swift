//
//  MainView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/23/21.
//

import SwiftUI
import xClient6001

struct MainView: View {
    @ObservedObject var radioManager: RadioManager

    @AppStorage("ShowSide") var showSide = false

    var body: some View {
        HStack {
            VSplitView {
                PanafallsView(radioManager: radioManager)
                BottomView()
            }
            if showSide { SideView() }
        }.frame(minWidth: 610, maxWidth: .infinity, minHeight: 250, maxHeight: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(radioManager: RadioManager(delegate: XSDR6001() as RadioManagerDelegate))
    }
}
