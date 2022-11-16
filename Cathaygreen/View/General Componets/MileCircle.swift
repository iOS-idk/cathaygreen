//
//  MileCircle.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct MileCircle: View {
    @State var mile: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.mileCircleBorderColor)
                .shadow(radius: 10)
                .frame(width: 260, height: 260)
            
            Circle()
                .fill(.white)
                .frame(width: 230, height: 230)
            
            VStack {
                Text("\(mile)")
                    .font(.custom("Helvetica Neue Bold", size: 75))
                    .padding(.leading)
                    .foregroundColor(Color.accentColor)
                
                Text("ASIA MILES")
                    .font(.custom("Helvetica Neue Bold", size: 20))
                    .foregroundColor(Color.accentColor)
            }
        }
    }
}

struct MileCircle_Previews: PreviewProvider {
    static var previews: some View {
        MileCircle(mile: 50)
    }
}
