//
//  ProfileManager.swift
//  networking&Events
//
//  Created by bekarys abiev on 22.03.2026.
//

import Foundation
import Foundation
import UIKit
class ProfileManager {
    
    // Папканы табу
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Суретті телефонға сақтау
    func saveProfileImage(data: Data, uid: String) {
        guard !uid.isEmpty else { return }
        let fileName = "profile_\(uid).png"
        let url = getDocumentDirectory().appendingPathComponent(fileName)
        try? data.write(to: url)
    }
    
    // Суретті телефоннан оқу
    func loadProfileImage(uid: String) -> Data? {
        guard !uid.isEmpty else { return nil }
        let fileName = "profile_\(uid).png"
        let url = getDocumentDirectory().appendingPathComponent(fileName)
        return try? Data(contentsOf: url)
    }
}
