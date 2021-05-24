//
//  PanadapterView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI
import xClient6001
import xLib6001

struct PanadapterView: View {
    @ObservedObject var radioManager: RadioManager
    @ObservedObject var panadapter: Panadapter

    @State var freqStep = 25_000
    @State var dbmStep = 10

    var body: some View {

        let dbmValues = ViewModel.dbmValues(pan: panadapter, step: dbmStep)
        let freqValues = ViewModel.freqValues(pan: panadapter, step: freqStep)

        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ZStack {
                    FrequencyLinesView(values: freqValues)
                    DbmLinesView(values: dbmValues)
                    //                        PanadapterGraphicView()
                }
                DbLegendView(values: dbmValues, lineCount: (panadapter.maxDbm - panadapter.minDbm) / CGFloat(dbmStep))
            }
            FrequencyLegendView(values: freqValues, lineCount: (CGFloat(panadapter.center + (panadapter.bandwidth/2)) - CGFloat(panadapter.center - (panadapter.bandwidth/2))) / CGFloat(freqStep))
        }
        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
        .border(Color(.labelColor))
    }

    // ----------------------------------------------------------------------------

}

struct PanadapterView_Previews: PreviewProvider {
    static var previews: some View {
        PanadapterView(radioManager: RadioManager(delegate: XSDR6001() as RadioManagerDelegate), panadapter: Panadapter(0))
    }
}
