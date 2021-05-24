//
//  FrequencyLinesView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI

struct FrequencyLinesView: View {
    let values: [ViewModel.LegendValue]

    @State var gridColor: Color = .white

    var body: some View {
        VStack {
            GeometryReader { geo in
                ForEach(values, id: \.id) { legend in
                    if legend.id != 0 {
                        Path { path in
                            path.move(to: CGPoint(x: legend.id * geo.size.width, y: 0))
                            path.addLine(to: CGPoint(x: legend.id * geo.size.width, y: geo.size.height))
                        }
                        .stroke(lineWidth: 0.5)
                        .fill(gridColor.opacity(0.5))
                    }
                }
            }
        }
        .border(Color(.red))
        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    }
}

struct FrequencyLinesView_Previews: PreviewProvider {
    static var previews: some View {
        FrequencyLinesView(values: [ViewModel.LegendValue]())
    }
}
