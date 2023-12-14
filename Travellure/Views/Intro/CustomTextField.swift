//
//  CustomTextField.swift
//  Travellure
//
//  Created by veronica.gliga on 17.04.2024.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    
    @Binding var text: String
    
    var hint: String
    var leadingIcon: Image
    var isPassword: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: -10) {
            leadingIcon
                .font(.callout)
                .foregroundColor(.gray)
                .frame(width: 40, alignment: .leading)
            
            if isPassword {
                SecureField(hint, text: $text)
            } else {
                TextField(hint, text: $text)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.gray.opacity(0.1))
        }
    }
}
