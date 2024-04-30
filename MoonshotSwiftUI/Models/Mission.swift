//
//  Mission.swift
//  MoonshotSwiftUI
//
//  Created by Nitish on 19/04/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let description: String
    let crew: [Crew]
    
    var missionImage: String {
        "apollo\(id)"
    }
    
    var missionName: String {
        "Apollo \(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "NA"
    }
}

struct Crew: Codable {
    let name: String
    let role: String
    //let age: Int
}
