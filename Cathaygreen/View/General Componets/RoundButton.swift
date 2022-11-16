//
//  RouteButton.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .padding()
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .font(.custom("Helvetica Neue Bold", size: 26))
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(16)
        }

    }
}

struct RouteButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(title: "HKG")
    }
}
