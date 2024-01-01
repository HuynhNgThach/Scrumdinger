//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 30/12/2023.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) {theme in
                    ThemeView(theme: theme)
                    .tag(theme)
            }
        }.pickerStyle(.navigationLink)
    }
}

#Preview {
    //se the constant(_:) type method to create a binding to a hard-coded, immutable value. Constant bindings are useful in previews or when prototyping your app’s user interface.
    NavigationStack {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
