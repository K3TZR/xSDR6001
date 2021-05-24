//
//  PanadapterView.swift
//  TestxSDRLayout
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


    func freqValues(pan: Panadapter, step: Int) -> [XSDR6001.LegendValue] {
        var values = [XSDR6001.LegendValue]()

        let maxFreq = CGFloat(panadapter.center + (panadapter.bandwidth/2))
        let minFreq = CGFloat(panadapter.center - (panadapter.bandwidth/2))

        var value = minFreq

        values.append( XSDR6001.LegendValue(id: 0, value: value) )
        repeat {
            let next = value + CGFloat(step)
            value = next > maxFreq ? maxFreq : next
            let position = (value - minFreq) / (maxFreq - minFreq)
            values.append( XSDR6001.LegendValue(id: position, value: value) )
        } while value != maxFreq
        return values
    }

    var body: some View {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ZStack {
                        FrequencyLinesView(values: freqValues(pan: panadapter, step: freqStep))
                        DbmLinesView()
//                        PanadapterGraphicView()
                    }
//                    DbLegendView()
                }
                let lineCount = (CGFloat(panadapter.center + (panadapter.bandwidth/2)) - CGFloat(panadapter.center - (panadapter.bandwidth/2))) / CGFloat(freqStep)
                FrequencyLegendView(values: freqValues(pan: panadapter, step: freqStep), lineCount: lineCount)
            }
            .frame(minWidth: 400, maxWidth: .infinity, minHeight: 100 + 20, maxHeight: .infinity)
    }
}

struct PanadapterView_Previews: PreviewProvider {
    static var previews: some View {
        PanadapterView(radioManager: RadioManager(delegate: XSDR6001() as RadioManagerDelegate), panadapter: Panadapter(0))
    }
}
