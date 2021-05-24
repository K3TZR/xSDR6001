//
//  FrequencyLegendView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI
import xLib6001

struct FrequencyLegendView: View {
    let values: [ViewModel.LegendValue]
    let lineCount: CGFloat

    @State var legendColor: Color = .green
    @State var freqLegendHeight: CGFloat = 20

    var body: some View {

        GeometryReader { geo in
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    ForEach(values, id: \.id) { legend in
                        if legend.id == 0 || legend.id == 1 {
                            Text("").frame(width: (geo.size.width / lineCount) / 2, alignment: .center)
                        } else {
                            Text("\(String(format: "%02.3f", Double(legend.value) / 1_000_000))").frame(width: (geo.size.width / lineCount), alignment: .center)
                        }
                    }
                }
            }
            .frame(minWidth: 400, maxWidth: .infinity, minHeight: freqLegendHeight, maxHeight: freqLegendHeight)
            .foregroundColor(legendColor)
        }
    }
}

struct FrequencyLegendView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyLegendView(values: [ViewModel.LegendValue](), lineCount: 0)
    }
}
