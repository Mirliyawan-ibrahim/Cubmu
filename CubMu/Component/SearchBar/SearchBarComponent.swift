//
//  SearchBarComponent.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import SwiftUI


struct SearchBarComponent: View {
    
    @Binding var searchText: String
    @Binding var backSearch: Bool
    
    var body: some View {
        HStack(spacing: 17) {
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 19, height: 19)
                .foregroundColor(Color.black.opacity(0.6))
                .onTapGesture {
                    withAnimation(.spring()) {
                        backSearch.toggle()
                    }
                }
            TextField("Cari Coupon", text: $searchText)
                .foregroundColor(Color.black)
                .disableAutocorrection( true)
                .autocapitalization(.none)
                
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .scaledToFit()
                .offset(x: -2)
                .frame(width: 16, height: 16)
                .foregroundColor(Color.gray.opacity(0.7))
                .opacity(searchText.isEmpty ? 0 : 1)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                    searchText = ""
                }
        }
        .frame(maxWidth: .infinity)
        .font(.custom("PlusJakartaSans-Reguler", size: 15))
        .padding(.horizontal)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.white))
        )
        .padding(.horizontal, 4)

    }
    
}

struct SearchBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarComponent(searchText: .constant(""), backSearch: .constant(false))
    }
}

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
