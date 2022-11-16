//
//  RadioButton.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 16/11/2022.
//

import SwiftUI

struct RadioButton: View {
    let id: String
    let selectedID: String
    let callBack: (String) -> ()

    init(id: String, selectedID: String, callBack: @escaping (String) -> ()) {
        self.id = id
        self.selectedID = selectedID
        self.callBack = callBack
    }
    
    var body: some View {
        Button(action:{
            self.callBack(self.id)
        }, label: {
            HStack(alignment: .center, spacing: 12, content: {
                Image(systemName: self.selectedID == self.id ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(self.selectedID == self.id ? Color.blue : Color.black)
                Text (self.id)
                    .font(Font.system(size: 20))
                    .foregroundColor(Color.black)
            })
        })
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(id: "1", selectedID: "1") { string in
            print(string)
        }
    }
}
