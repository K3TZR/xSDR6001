//
//  Panafall.swift
//  TestxSDRLayout
//
//  Created by Douglas Adams on 5/21/21.
//

import SwiftUI
import xClient6001
import xLib6001

struct PanafallView: View {
    @ObservedObject var radioManager: RadioManager
    @ObservedObject var panadapter: Panadapter

    @AppStorage("ShowButtons") var showButtons = false

    var body: some View {
        HStack(spacing: 0) {
            if showButtons { ButtonsView() }
            VSplitView {
                PanadapterView(radioManager: radioManager, panadapter: panadapter)
                WaterfallView()
            }
        }
        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 170, maxHeight: .infinity)
    }
}

struct PanafallView_Previews: PreviewProvider {
    static var previews: some View {
        PanafallView(radioManager: RadioManager(delegate: XSDR6001() as RadioManagerDelegate), panadapter: Panadapter(0))
    }
}
