//
//  BackgroundView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 38)
                .fill(Color.backgroundRectColor)
                .padding(EdgeInsets(top: 140, leading: 20, bottom: 20, trailing: 20))
            
            content
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            
        }
    }
}
