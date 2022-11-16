//
//  ShopListRow.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI

struct ShopListRow: View {
    @State var name: String
    @State var description: String
    
    var body: some View {
        HStack {
            // Image
            VStack {
                Text(name)
                    .font(.custom("Helvetica Neue Bold", size: 24))
                    .foregroundColor(Color.accentColor)
                Text(description)
                    .font(.custom("Helvetica Neue", size: 24))
                    .foregroundColor(Color.accentColor)
                
                RoundButton(title: "Reserve")
            }
        }

    }
}

struct ShopListRow_Previews: PreviewProvider {
    static var previews: some View {
        ShopListRow(name: "Ecological Compound", description: "Sisley")
    }
}
