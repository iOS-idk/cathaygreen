//
//  RouteButton.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct RoundButton: View {
    let title: String
    let cornerRadius: CGFloat
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .padding([.top, .bottom], 5)
                .font(.custom("Helvetica Neue Bold", size: 20))
                .frame(maxWidth: .infinity)
        }
        .cornerRadius(cornerRadius)
        .tint(Color.accentColor)
        .buttonStyle(.borderedProminent)
    }
}

struct RouteButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(title: "HKG", cornerRadius: 16)
    }
}