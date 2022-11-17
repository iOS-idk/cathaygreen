//
//  MenuGridRow.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct MenuGridRow: View {
    var body: some View {
        VStack {
            Text("H")
            Image(systemName: "hand.wave")
            Text("World")
        }
    }
}

struct MenuGridRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuGridRow()
    }
}
