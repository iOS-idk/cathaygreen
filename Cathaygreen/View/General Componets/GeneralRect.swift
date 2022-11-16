//
//  GeneralRect.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct GeneralRect: View {
    @State var rectWidth: Int = 380
    
    var body: some View {
        RoundedRectangle(cornerRadius: 33)
            .fill(.white)
            .frame(width: CGFloat(rectWidth), height: 100)
    }
}

struct GeneralRect_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            GeneralRect()
        }
    }
}
