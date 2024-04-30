//
//  AstronautView.swift
//  MoonshotSwiftUI
//
//  Created by Nitish on 19/04/23.
//

import SwiftUI

struct AstronautDetailView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                    Text(astronaut.description)
                        .padding(.horizontal)
                }
            }
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode(file: "astronauts.json")
    
    static var previews: some View {
        AstronautDetailView(astronaut: astronauts["grissom"]!)
    }
}
