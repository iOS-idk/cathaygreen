//
//  RadioButtonGroups.swift
//  Cathaygreen
//
//  Created by Chak Kei Lee on 17/11/2022.
//

import SwiftUI

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var options = ["Skip", "Half ration foods", "Low carbon food"]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(options, id: \.self) { name in
                RadioButton(
                    id: name,
                    label: name,
                    isMarked: selectedId == name ? true : false,
                    callback: radioGroupCallback
                )
            }
        
        }
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
struct RadioButtonGroups_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroups { selected in
            print("Selected Gender is: \(selected)")
        }
    }
}
