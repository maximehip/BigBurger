//
//  BurgerDetails.swift
//  BigBurger
//
//  Created by Maxime on 07/09/2022.
//

import SwiftUI

struct BurgerDetails: View {
    @State var burgers: [Burger]
    @State var total: Float = 0
    var body: some View {
        if !burgers.isEmpty {
            List(burgers, id: \.ref) { burger in
                BurgerView(burger: burger, showDeleteButton: true, selectedBuger: $burgers)
            }
            .onAppear {
                burgers.map { burger in
                    print(burger.price)
                    total += Float(burger.price) / 100
                }
            }
            Text("Total \(total)€")
        } else {
            Text("Card empty")
        }
    }
}
