//
//  PageTitle.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct PageTitle: View {
    let name: String
    
    var body: some View {
        let splitedName = name.split(separator: " ")
        
        ZStack {
            GeneralRect().padding([.leading, .trailing], 10)
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
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            PageTitle(name: "Eat Greener")
        }
      
    }
}
