//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by sakai on 13/05/2023.
//

import SwiftUI
import Firebase
@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
