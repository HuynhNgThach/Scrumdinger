//
//  ScrumDetailEdit.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 30/12/2023.
//

import SwiftUI

struct ScrumDetailEdit: View {
    @State private var scrum: DailyScrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Tilte", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }header: {
                Text("Metting Info")
            }
            Section {
                ForEach(scrum.attendees) {attendee in
                    HStack {
                        Text(attendee.name)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                scrum.attendees =  scrum.attendees.filter{ $0.id != attendee.id }
                            }
                        }) {
                            Image(systemName: "minus.circle.fill").foregroundColor(.red)
                        }
                    }
                }.onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }.disabled(newAttendeeName.isEmpty)
                }
            } header: {
                Text("Attendees")
            }
        }
    }
}

#Preview {
    ScrumDetailEdit()
}
