//
//  Bundle+Extension.swift
//  WecareForU
//
//  Created by apple on 4/27/22.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T?
    {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        return loaded
    }
    
}
