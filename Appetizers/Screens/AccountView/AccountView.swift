//
//  AccountView.swift
//  Appetizers
//
//  Created by Daniel Moura on 06/02/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    @FocusState private var focusedTextField: FormTextField?
    enum FormTextField {
        case firstName, lastName, email
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal info")) {
                    TextField("First name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", 
                               selection: $viewModel.user.birthdate,
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.onSaveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra napkins", isOn: $viewModel.user.extraNapkins)
                        .tint(.brandPrimary)
                        .onChange(of: viewModel.user.extraNapkins) {
                            viewModel.saveUserRequests()
                        }
                    Toggle("Frequent refills", isOn: $viewModel.user.frequentRefills)
                        .tint(.brandPrimary)
                        .onChange(of: viewModel.user.frequentRefills) {
                            viewModel.saveUserRequests()
                        }
                }
            }
            .navigationTitle("👤 Account")
            .toolbar {
                #if os(iOS)
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
                #endif
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, 
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
