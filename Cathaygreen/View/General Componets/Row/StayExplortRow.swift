//
//  StayExplortListRow.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 15/11/2022.
//

import SwiftUI

struct StayExplortRow: View {
    let stayExplore: StayExplore
    
    var body: some View {
        VStack(spacing: -30) {
            GeometryReader { geo in
                Image(stayExplore.name.lowercased())
                    .resizable()
                    .cornerRadius(8)
            }
            .frame(maxHeight: 200)
            .scaledToFill()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(stayExplore.name)
                        .font(.custom("Helvetica Neue Bold", size: 20))
                        .foregroundColor(Color.accentColor)
                    Text(stayExplore.description)
                        .font(.custom("Helvetica Neue", size: 14))
                        .foregroundColor(Color.accentColor)
                }
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
         
                VStack(alignment: .trailing) {
                    RoundButton(title: "Reserve", cornerRadius: 20)
                   
                    
                    HStack {
                        Image("co2")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("\(stayExplore.mile) Miles")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(Color.accentColor)
                          
                    }
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: 130)
            }
          
        }
    }
}

struct StayExplortListRow_Previews: PreviewProvider {
    static var previews: some View {
        StayExplortRow(stayExplore: StayExplore(name: "Hotel ICON", description: "CarbonCare Label", mile: 30))
            .padding([.leading, .trailing], 40)
    }
}
