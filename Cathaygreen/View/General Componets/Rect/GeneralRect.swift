//
//  GeneralRect.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct GeneralRect: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 33)
            .fill(.white)
            .frame(height: 100)
    }
}

struct GeneralRect_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            GeneralRect().padding([.leading, .trailing], 5)
        }
    }
}
