//
//  HeadingTextView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct HeadingText: View {
    let name: String
    
    var body: some View {
        let splitedName = name.split(separator: " ")
        
        HStack {
            Text(splitedName[0])
                .font(.custom("Helvetica Neue Bold", size: 34))
                .foregroundColor(Color.accentColor)
            Text(splitedName[1])
                .font(.custom("Helvetica Neue Bold", size: 34))
                .foregroundColor(Color.accentColor)
        }
    }
}


struct HeadingTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingText(name: "Eat Greener")
    }
}
