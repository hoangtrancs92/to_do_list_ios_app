//
//  NewItemView.swift
//  ToDoList
//
//  Created by sakai on 13/05/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 80)
            Form{
                TextField("Tittle", text:$viewModel.title )
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", background: .pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Erorr"), message: Text("Please fill in all fields and due date newer."))
            }
                
            
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: {
            _ in
        }))
    }
}
