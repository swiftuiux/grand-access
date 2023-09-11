//
//  GrandAccessModifier.swift
//
//  Created by Igor Shel on 13.07.2023.
//

import SwiftUI

/// Show grand access alert
public struct GrandAccessModifier: ViewModifier {
    
    /// Text of title
    let title : LocalizedStringKey
    
    /// The main message
    let message : LocalizedStringKey
        
    /// Binding to on\of alert
    @Binding var showingAlert : Bool
    
    // MARK: - Life circle
    
    public init(title: LocalizedStringKey, message: LocalizedStringKey, showingAlert: Binding<Bool>) {
        self.title = title
        self.message = message
        self._showingAlert = showingAlert
    }
    
    public func body(content: Content) -> some View {
        content
            .alert(Text(title, bundle: .module), isPresented: $showingAlert) {
                Button(action: {}, label: {
                    Text("not_now", bundle: .module) })
                Button("settings", role: .none) { onSettings() }
                    }
            message: {
                Text(message, bundle: .module)
            }
    }
    
    private func onSettings(){
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}