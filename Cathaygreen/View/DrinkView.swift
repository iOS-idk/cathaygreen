//
//  DrinkView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct DrinkView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var numRewards: Int = 2
    
    var body: some View {
        VStack {
            PageHeadingView(name: "DRINK GREENER")
            
            ZStack {
                RoundButton(title: "Buy reusable mug", cornerRadius: 30, textPadding: 8).padding([.leading, .trailing], 50)
                
                Image("drink")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x: -120, y: -15)
            }
            
            Text("REWARDS")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            
            ForEach((1...numRewards), id: \.self) { _ in
                rewardsRect()
            }
            
            Image("co2")
                .resizable()
                .frame(width: 30, height: 30)
            Text("10 miles reward per use.")
                .font(.custom("Helvetica Neue", size: 16))
                .foregroundColor(Color.accentColor)
        }
    }
    
    private func rewardsRect() -> some View {
        GeneralRect {
            HStack {
                Text("10 min ago")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                
                Spacer()
                
                VStack {
                    MileText(mile: 20, textSize: 40)
                }
            
            }
            .padding([.leading, .trailing], 30)
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            DrinkView().environmentObject(ViewRouter())
        }
    }
}
