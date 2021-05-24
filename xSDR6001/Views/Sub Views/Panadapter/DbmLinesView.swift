//
//  DbLines.swift
//  TestxSDRLayout
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI

struct DbmLinesView: View {

    var body: some View {
        HStack {
            Spacer()
            Button("DbmLines") {}
            Spacer()
        }
        .frame(minWidth: 400, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    }
}

struct DbLines_Previews: PreviewProvider {
    static var previews: some View {
        DbmLinesView()
    }
}
