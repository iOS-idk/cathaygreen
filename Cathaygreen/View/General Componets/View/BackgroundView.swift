//
//  BackgroundView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            BackgroundRect()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
