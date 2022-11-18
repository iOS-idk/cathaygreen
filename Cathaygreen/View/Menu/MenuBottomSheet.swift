//
//  MenuBottomSheet.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI
import BottomSheet

class BottomSheetLevel: ObservableObject {
    @Published var bottomSheetPosition: BottomSheetPosition = .relative(0.1)
}

struct MenuBottomSheet: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var bottomSheetLevel: BottomSheetLevel
    
    private let twoColumnGrid = Array(repeating: GridItem(.flexible()), count: 2)

    private var isLarge: Bool {
        return bottomSheetLevel.bottomSheetPosition == .relative(1) ? true : false
    }
    
    private var backgroundColor: Color {
        return !isLarge ? viewRouter.currentPage == .home ? .accentColor : .white : .backgroundRectColor
    }

    var body: some View {
        ZStack {
            
        }
        .bottomSheet(bottomSheetPosition: $bottomSheetLevel.bottomSheetPosition, switchablePositions: [.relative(0.1), .relative(1)]) {
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
        .dragIndicatorColor(!isLarge ? backgroundColor : .accentColor)
        .padding([.leading, .trailing], 10)
    }
    
    private func homeSmallMenuSheet() -> some View {
        HStack {
            Text("Explorer more")
                .font(.custom("Helvetica Neue Bold", size: 26))
                .foregroundColor(isLarge ? .accentColor : .white)
            if !isLarge {
                Button {
                    bottomSheetLevel.bottomSheetPosition = .relative(1)
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
            }
        }
    }
    private func nothomeSmallMenuSheet() -> some View {
        HStack {
            if !isLarge {
                Button {
                    viewRouter.currentPage = .home
                } label: {
                    Image(systemName: "arrow.up.backward.circle")
                        .font(.system(size: 30))
                        .foregroundColor(Color.accentColor)
                        .rotationEffect(.degrees(-45))
                }
                Spacer()
            }
            
            Text("Explorer more")
                .font(.custom("Helvetica Neue Bold", size: 26))
                .foregroundColor(.accentColor)
            
            if !isLarge {
                Button {
                    bottomSheetLevel.bottomSheetPosition = .relative(1)
                } label: {
                    Image(systemName: "arrow.up")
                        .padding()
                        .frame(width: 34, height: 34)
                        .foregroundColor(Color.white)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                }
            }
        }
        .padding([.leading, .trailing], 20)
    }
    
    @ViewBuilder
    private func smallMenuSheet() -> some View {
        if viewRouter.currentPage == .home {
            homeSmallMenuSheet()
        } else {
            nothomeSmallMenuSheet()
        }
    }
    private func fullMenuSheet() -> some View {
        VStack {
            Divider()
            ScrollView {
                Text("Before flight")
                    .font(.custom("Helvetica Neue Bold", size: 20))
                    .foregroundColor(Color.accentColor)
                MenuGridItemButton(titleType: .pack)
                
                Text("In-flight")
                    .font(.custom("Helvetica Neue Bold", size: 20))
                    .foregroundColor(Color.accentColor)
                LazyVGrid(columns: twoColumnGrid) {
                    MenuGridItemButton(titleType: .eat)
                    MenuGridItemButton(titleType: .drink)
                }
                
                Text("Anytime")
                    .font(.custom("Helvetica Neue Bold", size: 20))
                    .foregroundColor(Color.accentColor)
                LazyVGrid(columns: twoColumnGrid) {
                    MenuGridItemButton(titleType: .stay)
                    MenuGridItemButton(titleType: .explore)
                    MenuGridItemButton(titleType: .shop)
                }
            }
            .scrollIndicators(.hidden)
            .padding([.leading, .trailing])
        }
    }
}

struct MenuBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView {
            MenuBottomSheet()
                .environmentObject(ViewRouter())
                .environmentObject(BottomSheetLevel())
        }
    }
}
