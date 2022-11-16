//
//  StayExplortListRow.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct StayExplortListRow: View {
    @State var name: String
    @State var description: String
    
    var body: some View {
        VStack {
            RoundButton(title: "Reserve")
            Text(name)
                .font(.custom("Helvetica Neue Bold", size: 24))
                .foregroundColor(Color.accentColor)
            Text(description)
                .font(.custom("Helvetica Neue", size: 24))
                .foregroundColor(Color.accentColor)
        }
    }
}

struct StayExplortListRow_Previews: PreviewProvider {
    static var previews: some View {
        StayExplortListRow(name: "Hotel ICON", description: "CarbonCare Label")
    }
}
