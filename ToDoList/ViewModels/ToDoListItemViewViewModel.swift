//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by sakai on 13/05/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ToDoListItemViewViewModel: ObservableObject {
    init() {
        
    }
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}

