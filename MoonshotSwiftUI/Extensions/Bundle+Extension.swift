//
//  Bundle+Extension.swift
//  MoonshotSwiftUI
//
//  Created by Nitish on 18/04/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(file: String) -> T {
        
        guard let fileURL = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in Bundle.")
        }
        
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Failed to load \(file) from Bundle.")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data from \(file)")
        }
        
        return decodedData
    }
}
