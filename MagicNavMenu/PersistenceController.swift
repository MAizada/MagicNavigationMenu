//
//  PersistenceController.swift
//  MagicNavMenu
//
//  Created by Aizada on 22.02.2024.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MagicNavMenu") 
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading store: \(error.localizedDescription)")
            }
        }
    }
}

