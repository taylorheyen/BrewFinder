//
//  BrewView.swift
//  BrewFinder
//
//  Created by Taylor Heyen on 4/24/23.
//
import SwiftUI

struct BrewView: View {
    let city: String
    let state: String

    @ObservedObject var breweryvm = BreweryViewModel()
    @State private var currentPage: Int = 1

    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack {
                Text(city)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top)
                List {
                    ForEach(breweryvm.breweries, id: \.name) { brewery in
                        NavigationLink(destination: BreweryDetail(breweryDetailVM: breweryvm, brewery: brewery)) {
                            Text(brewery.name)
                                .foregroundColor(.black)
                        }
                        .listRowBackground(Color.orange)
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    breweryvm.fetchData(city: city, state: state, page: currentPage) {
                        print("Loaded data for page \(currentPage)")
                    }
                }
                
                HStack {
                    Button(action: {
                        if currentPage > 1 {
                            currentPage -= 1
                            breweryvm.fetchData(city: city, state: state, page: currentPage) {
                                print("Loaded data for page \(currentPage)")
                            }
                        }
                    }) {
                        Image(systemName: "arrow.left")
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        currentPage += 1
                        breweryvm.fetchData(city: city, state: state, page: currentPage) {
                            print("Loaded data for page \(currentPage)")
                        }
                    }) {
                        Image(systemName: "arrow.right")
                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView(city: "San Francisco", state: "California")
    }
}

