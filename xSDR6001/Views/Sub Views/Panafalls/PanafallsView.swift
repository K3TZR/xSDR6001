//
//  PanafallsView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI
import xClient6001
import xLib6001

struct PanafallsView: View {
    @ObservedObject var radioManager: RadioManager

    @AppStorage("ShowSide") var showSide = false
    @AppStorage("numberOfPanadapters") var numberOfPanadapters = 1

    var body: some View {
        if radioManager.activeRadio != nil {
            let panadapters: [Panadapter] = Array(radioManager.activeRadio!.panadapters.values)

            ForEach(panadapters) { panadapter in
                PanafallView(radioManager: radioManager, panadapter: panadapter)
            }

        } else {
            EmptyView()
        }


    }
}

struct PanafallsView_Previews: PreviewProvider {
    static var previews: some View {
        PanafallsView(radioManager: RadioManager(delegate: XSDR6001() as RadioManagerDelegate))
    }
}
