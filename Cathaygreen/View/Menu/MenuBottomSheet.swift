//
//  MenuBottomSheet.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI
import BottomSheet

struct MenuBottomSheet: View {
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.1)

    private var isLarge: Bool {
        return bottomSheetPosition == .relative(1) ? true : false
    }
    
    private var backgroundColor: Color {
        return isLarge ? .white : .accentColor
    }

    var body: some View {
        ZStack {
            
        }
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.relative(0.1), .relative(1)]) {
            VStack {
                smallMenuSheet()
                if isLarge {
                    fullMenuSheet()
                }
            }
        }
        .customBackground(
            backgroundColor.edgesIgnoringSafeArea(.all)
                .cornerRadius(32, corners: [.topLeft, .topRight])
        )
        .dragIndicatorColor(.accentColor)
        .padding([.leading, .trailing], 10)
    }
    
    @ViewBuilder
    private func smallMenuSheet() -> some View {
        HStack {
            Text("Explorer more")
                .font(.custom("Helvetica Neue Bold", size: 26))
                .foregroundColor(isLarge ? .accentColor : .white)
            if !isLarge {
                Button {
                    bottomSheetPosition = .relative(1)
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
    }
    private func fullMenuSheet() -> some View {
        VStack {
            Divider()
            ScrollView {
                LazyHGrid(rows: threeColumnGrid) {
                    HStack {
                        VStack {
                            Text("H")
                            Image(systemName: "hand.wave")
                            Text("World")
                        }
                        VStack {
                            Text("H")
                            Image(systemName: "hand.wave")
                            Text("World")
                        }
                        VStack {
                            Text("H")
                            Image(systemName: "hand.wave")
                            Text("World")
                        }
                    }
                }
            }
        }
    }
}

struct MenuBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
            MenuBottomSheet()
        }
    }
}
