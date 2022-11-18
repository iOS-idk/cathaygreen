//
//  MileCircle.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct MileCircle: View {

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.mileCircleBorderColor)
                .shadow(radius: 10)
                
            Circle()
                .fill(.white)
                .padding(.all, 10)
        }
        .padding([.leading, .trailing], 80)
    }
}

struct MileCircle_Previews: PreviewProvider {
    static var previews: some View {
        MileCircle()
    }
}
