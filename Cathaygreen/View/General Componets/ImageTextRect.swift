//
//  ImageTextRect.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct ImageTextRect: View {
    
    @State var title: String
    @State var description: String
    
    var body: some View {
        ZStack {
            GeneralRect()
            HStack {
                Image(systemName: "trash")
        
                VStack {
                    Text(title)
                        .font(.custom("Helvetica Neue Bold", size: 26))
                        .foregroundColor(Color.accentColor)
                    Text(description)
                        .font(.custom("Helvetica Neue", size: 13))
                        .foregroundColor(Color.accentColor)
                }
            }
        }
    }
}

struct ImageTextRect_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            ImageTextRect(title: "Pack Greener", description: "Reduce fossil fuel with lighter belongings.")
        }
    }
}
