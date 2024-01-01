//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 01/01/2024.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    
    var body: some View {
        NavigationStack {
            ScrumDetailEdit(scrum: $newScrum)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData),isPresentingNewScrumView: .constant(true))
}
