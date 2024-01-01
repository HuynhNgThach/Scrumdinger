//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 30/12/2023.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)// make the text span full width of parent
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
           
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
