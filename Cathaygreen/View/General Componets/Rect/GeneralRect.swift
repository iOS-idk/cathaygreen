//
//  GeneralRect.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct GeneralRect<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 33)
                .fill(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
            
            content
        }
        .padding([.leading, .trailing], 10)
    }
}

struct GeneralRect_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            GeneralRect {
                Text("Hello")
            }
            .padding([.leading, .trailing], 5)
        }
    }
}
