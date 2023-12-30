//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 29/12/2023.
//

import SwiftUI

struct ScrumView: View {
    let scrums: [DailyScrum]
    
    
    var body: some View {
        NavigationStack {
            List(scrums)  { scrum in
                NavigationLink {
                    Text(scrum.title)
                } label: {
                    CardView(scrum: scrum)
                        .listRowBackground(scrum.theme.mainColor)
                }
                .listRowBackground(scrum.theme.mainColor)
                
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        
    }
}

#Preview {
    ScrumView(scrums: DailyScrum.sampleData)
}
