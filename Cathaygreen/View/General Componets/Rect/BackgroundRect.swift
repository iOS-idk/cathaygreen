//
//  BackgroundRect.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct BackgroundRect: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 38)
            .fill(Color.backgroundRectColor)
            .padding(EdgeInsets(top: 140, leading: 20, bottom: 20, trailing: 20))
        
    }
}

struct BackgroundRect_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundRect()
    }
}
