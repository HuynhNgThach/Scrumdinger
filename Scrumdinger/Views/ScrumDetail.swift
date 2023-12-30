//
//  ScrumDetail.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 30/12/2023.
//

import SwiftUI

struct ScrumDetail: View {
    let scrum: DailyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink {
                    MeetingView()
                    
                } label: {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section {
                ForEach(scrum.attendees) {attendee in
                    Label(attendee.name, systemImage: "person")
                }
            } header: {
                Text("Attendees")
            }
        }
        .toolbar {
            Button(action: {isPresentingEditView = true}, label: {
                Text("Edit")
            })
        }
        .navigationTitle(scrum.title)
        //When you add navigation modifiers, such as title and bar items, to child views, the system propagates the modifiers to the parent NavigationStack.
        .sheet(isPresented: $isPresentingEditView) {
            
            NavigationStack {
                ScrumDetailEdit()
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                    }
            }
            
        }
        
    }
}

#Preview {
    NavigationStack {
        ScrumDetail(scrum: DailyScrum.sampleData[0])
    }
}
