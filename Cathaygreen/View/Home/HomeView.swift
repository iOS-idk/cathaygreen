//
//  HomeView.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 14/11/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                MileCircle()
                MileText(mile: 50)
            }

            Text("Next Flight")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            
            HStack {
                RoundButton(title: "HKG", cornerRadius: 16)
       
                RoundButton(title: "HKG", cornerRadius: 16)
                
                RoundButton(title: "LHR", cornerRadius: 16)
                  
            }
            .padding([.leading, .trailing], 80)
            
            Text("9 hours")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
    
            Text("Go Green Advices")
                .font(.custom("Helvetica Neue Bold", size: 16))
                .foregroundColor(Color.accentColor)
            
            imageTextButton(titleType: .pack, description: "Reduce fossil fuel with lighter belongings.")
            
            imageTextButton(titleType: .eat, description: "See greener food suggestions.")
        }
        .padding(.top, 30)
    }

    private func imageTextButton(titleType: Page, description: String) -> some View {
        Button {
            viewRouter.currentPage = titleType
        } label: {
            HStack {
                
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 54, height: 54)
                    .foregroundColor(.green)
                
                VStack {
                    Text("\(titleType.rawValue.uppercased()) GREENER")
                        .font(.custom("Helvetica Neue Bold", size: 26))
                        .foregroundColor(Color.accentColor)
                    Text(description)
                        .font(.custom("Helvetica Neue", size: 13))
                        .foregroundColor(Color.accentColor)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .tint(.white)
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .padding([.leading, .trailing], 10)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            HomeView().environmentObject(ViewRouter())
        }
    }
}
