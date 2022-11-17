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
                .padding()
                .padding([.leading, .trailing], 10)
                .font(.custom("Helvetica Neue Bold", size: 26))
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(cornerRadius)
        }
    }
}

struct RouteButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton(title: "HKG", cornerRadius: 16)
    }
}
