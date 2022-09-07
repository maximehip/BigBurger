//
//  BurgerView.swift
//  BigBurger
//
//  Created by Maxime on 07/09/2022.
//

import SwiftUI

struct BurgerView: View {
    @State var burger: Burger
    @State var showDeleteButton: Bool
    @Binding var selectedBuger: [Burger]
    var body: some View {
        HStack {
            ZStack {
                if showDeleteButton {
                    Button {
                        selectedBuger.remove(at: selectedBuger.firstIndex(of: burger)!)
                    } label: {
                        Image(systemName: "minus.circle")
                            .offset(x: -20, y: -20)
                            .zIndex(10)
                    }
                }
                AsyncImage(url: URL(string: burger.thumbnail)) { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .foregroundColor(.orange)
                } placeholder: {
                    ProgressView()
                }
            }
            VStack {
                Text(burger.title)
                Text(burger.description)
                    .lineLimit(1)
            }
        }
    }
}
