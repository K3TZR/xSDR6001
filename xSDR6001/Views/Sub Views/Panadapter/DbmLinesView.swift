//
//  DbLinesView.swift
//  xSDR6001
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI

struct DbmLinesView: View {
    let values: [ViewModel.LegendValue]

    @State var gridColor: Color = .white

    var body: some View {
        VStack {
            GeometryReader { geo in
                ForEach(values, id: \.id) { value in
                    if value.id != 0 {
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: value.id * geo.size.height))
                            path.addLine(to: CGPoint(x: geo.size.width, y: value.id * geo.size.height))
                        }
                        .stroke(lineWidth: 0.5)
                        .fill(gridColor.opacity(0.5))
                    }
                }
            }
        }
        .border(Color(.red))
    }
}


//    var body: some View {
//        HStack {
//            Spacer()
//            Button("DbmLines") {}
//            Spacer()
//        }
//        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
//    }
//}

struct DbLines_Previews: PreviewProvider {
    static var previews: some View {
        DbmLinesView(values: [ViewModel.LegendValue]())
    }
}
