//
//  PanadapterGraphic.swift
//  TestxSDRLayout
//
//  Created by Douglas Adams on 5/20/21.
//

import SwiftUI

struct PanadapterGraphicView: View {

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("Panadapter Graphic") {}
                Spacer()
            }
            Spacer()
        }
        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    }
}

struct PanadapterGraphicView_Previews: PreviewProvider {
    static var previews: some View {
//        PanadapterGraphic(height: 200, width: 600)
        PanadapterGraphicView()
    }
}
