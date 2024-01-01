//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 29/12/2023.
//

import SwiftUI

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    
    
    var body: some View {
        NavigationStack {
            List($scrums)  { $scrum in
                NavigationLink {
                    ScrumDetail(scrum: $scrum)
                } label: {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
                
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums
                          , isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        
    }
}

#Preview {
    ScrumView(scrums: .constant(DailyScrum.sampleData))
}
