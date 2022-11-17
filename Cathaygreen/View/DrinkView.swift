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
        ZStack {
            BackgroundView()
   
            VStack {
                PageHeadingView(name: "DRINK GREENER")
                
                HStack {
                    RoundButton(title: "Buy reusable mug", cornerRadius: 30)
                }
                
                ForEach((1...numRewards), id: \.self) { _ in
                    rewardsRect()
                }
                
                Text("10 miles reward per use.")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)

            }
            MenuBottomSheet()
        }
    }
    
    private func rewardsRect() -> some View {
        ZStack {
            GeneralRect().padding([.leading, .trailing], 10)
            HStack {
                Text("10 min ago")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                    .padding(.leading, 30)
                
                Spacer()
                
                VStack {
                    MileText(mile: 20)
                }
            }
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView().environmentObject(ViewRouter())
    }
}
