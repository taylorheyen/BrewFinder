import SwiftUI
import MapKit
import URLImage

struct BreweryDetail: View {
    @ObservedObject var breweryDetailVM: BreweryViewModel
    var brewery: BreweryResults
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(brewery.name)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Text(brewery.websiteUrl)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                AddressView(address1: brewery.address1,
                            address2: brewery.address2,
                            city: brewery.city,
                            state: brewery.state,
                            postalCode: brewery.postalCode)
                .padding(.horizontal)
                
                MapView(coordinate: CLLocationCoordinate2D(latitude: Double(brewery.latitude!)!, longitude: Double(brewery.longitude!)!))
                    .frame(height: 300)
                    .padding(.horizontal)
                }
                        

        } .background(Color.orange)
        }
    }

