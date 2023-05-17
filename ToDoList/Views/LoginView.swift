//
//  LoginView.swift
//  ToDoList
//
//  Created by sakai on 13/05/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .blue)
               
                Form{
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TLButton(title: "Register", background: .purple){
                        viewModel.login()
                    }
                        .padding()
                }
                .padding()
                VStack{
                    Text("New account here ?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 20)
            }
        
            
        }
        }
        
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
