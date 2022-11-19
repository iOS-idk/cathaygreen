//
//  PageTitle.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct PageHeadingView: View {
    let name: String
    
    var body: some View {
        GeneralRect {
            HeadingText(name: name)
        }
    }
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            PageHeadingView(name: "Eat Greener")
        }
      
    }
}
