//
//  ContentView.swift
//  BigBurger
//
//  Created by Maxime on 07/09/2022.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State private var burgers = [Burger]()
    @State private var selectedBuger = [Burger]()
    @State private var isLoading = true
    var body: some View {
        NavigationView {
            if !isLoading {
                List(burgers, id: \.ref) { burger in
                    HStack {
                        BurgerView(burger: burger, showDeleteButton: false, selectedBuger: $selectedBuger)
                        if selectedBuger.contains(burger) {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        if !selectedBuger.contains(burger) {
                            selectedBuger.append(burger)
                        } else {
                            selectedBuger.remove(at: selectedBuger.firstIndex(of: burger)!)
                        }
                    }
                }
                .refreshable {
                    let request = AF.request("https://uad.io/bigburger/")
                    request.responseDecodable(of: [Burger].self) { response in
                        self.burgers = response.value!
                    }
                }
                .navigationTitle("Burgers")
                .toolbar {
                    NavigationLink {
                        BurgerDetails(burgers: selectedBuger)
                    } label: {
                        Text("Card")
                    }
                    
                    
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            let request = AF.request("https://uad.io/bigburger/")
            request.responseDecodable(of: [Burger].self) { response in
                self.burgers = response.value!
                self.isLoading = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
