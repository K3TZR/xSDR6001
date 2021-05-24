//
//  Buttons.swift
//  TestxSDRLayout
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI

struct ButtonsView: View {

    @AppStorage("showBorder") var showBorder = false
    @AppStorage("allEnabled") var allEnabled = false

    @State var enabled = false

    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                Button("Buttons (\(Int(geo.size.height)) x \(Int(geo.size.width)))") { enabled.toggle() }.rotationEffect(.degrees(-90), anchor: .topLeading).foregroundColor(Color(.red))
                Spacer()
            }
        }
        .frame(minWidth: 60, maxWidth: 60, minHeight: 420, maxHeight: .infinity)
        .if((allEnabled || enabled) && showBorder) { view in view.border(Color(.red)) }
        .if((allEnabled || enabled) && !showBorder) { view in view.background(Color(.red).opacity(0.2)) }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
