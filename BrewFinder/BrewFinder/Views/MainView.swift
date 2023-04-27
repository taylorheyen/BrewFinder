//
//  MainView.swift
//  BrewFinder
//
//  Created by Taylor Heyen on 4/24/23.
//
import SwiftUI

struct MainView: View {
    @State private var city: String = ""
    @State private var state: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Image("beers2")
                            .background(Color.orange)
                        Text("Enter Your Nearest City")
                            .font(.system(size: 20).weight(.heavy))
                        TextField("City", text: $city)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("State", text: $state)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        NavigationLink(destination: BrewView(city: city, state: state)) {
                            Text("Show Breweries")
                                .foregroundColor(.black)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 15)
                                .background(Color.gray)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .navigationTitle("Brew Finder")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

