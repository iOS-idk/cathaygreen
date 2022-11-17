//
//  HomeView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            ContentView()
            
            VStack(spacing: 10) {
                ZStack {
                    MileCircle()
                    MileText(mile: 50)
                }
                .frame(minWidth: 230, minHeight: 230)

                Text("Next Flight")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                
                HStack {
                    RoundButton(title: "HKG", cornerRadius: 16)
                    
                    
                    
                    RoundButton(title: "LHR", cornerRadius: 16)
                }
                
                Text("9 hours")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
        
                Text("Go Green Advices")
                    .font(.custom("Helvetica Neue Bold", size: 16))
                    .foregroundColor(Color.accentColor)
                
                imageTextRect(title: "Pack Greener", description: "Reduce fossil fuel with lighter belongings.")
                
                imageTextRect(title: "EAT", description: "See greener food suggestions.")
                
                MenuBottomSheet()
            }
            .padding(.top, 30)
        }
    }

    private func imageTextRect(title: String, description: String) -> some View {
        ZStack {
            GeneralRect().padding([.leading, .trailing], 10)
            HStack {
                Image(systemName: "trash")
        
                VStack {
                    Text(title)
                        .font(.custom("Helvetica Neue Bold", size: 26))
                        .foregroundColor(Color.accentColor)
                    Text(description)
                        .font(.custom("Helvetica Neue", size: 13))
                        .foregroundColor(Color.accentColor)
                }
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
