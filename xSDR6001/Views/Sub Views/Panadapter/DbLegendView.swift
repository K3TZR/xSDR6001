//
//  DbLegendView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI

struct DbLegendView: View {
    let values: [ViewModel.LegendValue]
    let lineCount: CGFloat

    @State var legendColor: Color = .green
    @State var dbmLegendWidth: CGFloat = 30

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .trailing, spacing: 0) {
                ForEach(values, id: \.id) { line in
                    if line.id != 1 {
                        if line.id == 0 {
                            Text("").frame(height: (geo.size.height / lineCount)/2, alignment: .topTrailing)
                        } else {
                            Text("\(String(format: "%3.0f", line.value))").frame(height: (geo.size.height / lineCount), alignment: .center)
                        }
                    }
                }
            }
            .frame(minWidth: dbmLegendWidth, maxWidth: dbmLegendWidth)
            .foregroundColor(legendColor)
        }
    }

//    var body: some View {
//        VStack {
//            Button("DB Legend") {  }
//        }
//        .frame(minWidth: 30, maxWidth: 30, minHeight: 100, maxHeight: .infinity)
//    }
}

struct DbLegendView_Previews: PreviewProvider {
    static var previews: some View {
        DbLegendView(values: [ViewModel.LegendValue](), lineCount: 0)
    }
}
