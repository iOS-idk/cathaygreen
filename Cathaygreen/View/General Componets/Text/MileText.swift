//
//  MileText.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct MileText: View {
    @State var mile: Int
    
    var body: some View {
        VStack {
            HStack {
                
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .frame(width: 34, height: 34)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                }
                
                Text("\(mile)")
                    .font(.custom("Helvetica Neue Bold", size: 75))
                    .foregroundColor(Color.accentColor)
            }

            Text("ASIA MILES")
                .font(.custom("Helvetica Neue Bold", size: 20))
                .foregroundColor(Color.accentColor)
        }
    }
}

struct MileText_Previews: PreviewProvider {
    static var previews: some View {
        MileText(mile: 50)
    }
}
