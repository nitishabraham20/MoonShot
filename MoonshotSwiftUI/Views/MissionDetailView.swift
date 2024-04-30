//
//  MissionDetailView.swift
//  MoonshotSwiftUI
//
//  Created by Nitish on 19/04/23.
//

import SwiftUI

struct MissionDetailView: View {
    
    let mission: Mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.missionImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    VStack(alignment: .leading) {
                        CustomDivider()
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        CustomDivider()
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crew in
                            NavigationLink {
                                AstronautDetailView(astronaut: crew.astronaut)
                            } label: {
                                Image(crew.astronaut.id)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle()
                                            .strokeBorder(.white, lineWidth: 2)
                                    }
                                VStack(alignment: .leading) {
                                    Text(crew.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                    Text(crew.role)
                                        .foregroundColor(.secondary)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle(mission.missionName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
    
    init(mission: Mission, astronauts: [String : Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map({ crew in
            if let astronaut = astronauts[crew.name] {
                return CrewMember(role: crew.role, astronaut: astronaut)
            } else {
                fatalError("Couldn't find \(crew.name) in the data")
            }
        })
    }
}

struct MissionDetailView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode(file: "missions.json")
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    
    static var previews: some View {
        MissionDetailView(mission: missions[0], astronauts: astronauts)
    }
}
