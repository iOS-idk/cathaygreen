//
//  MenuBottomSheet.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI

struct MenuBottomSheet: View {
    @State private var showingCredits = true
    
    private var isLarge: Bool {
        return selectedDetent == .large ? true : false
    }
    
    private var backgroundColor: Color {
        return isLarge ? .white : .accentColor
    }
    
    @State var selectedDetent: PresentationDetent = .fraction(0.1)

    var body: some View {
        ZStack {
            
        }
        .sheet(isPresented: $showingCredits) {
            ZStack {
                backgroundColor.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Explorer more")
                            .font(.custom("Helvetica Neue Bold", size: 26))
                            .foregroundColor(isLarge ? .accentColor : .white)
                            .padding()
       
                        if !isLarge {
          
                            Button {
                                selectedDetent = .large
                            } label: {
                                Image(systemName: "arrow.up")
                                    .padding()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(.accentColor)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    
                            }
                        }
                        
                    }
                    Divider()
                }

            }
            .presentationDetents([.fraction(0.1), .large], selection: $selectedDetent)
            .presentationDragIndicator(isLarge ? .hidden : .visible)
        }

    }
}

struct MenuBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        MenuBottomSheet()
    }
}
