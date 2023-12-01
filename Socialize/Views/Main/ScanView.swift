//
//  ScanView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI
import Foundation

import CoreLocation
import ObjectiveC

struct ScanView: View {
    @State private var gotoHome: Bool = false
    @State private var clicked = false
    @StateObject private var locationManager = LocationManager()
    @State private var nearbyUsers = [ScanModel]()
    
    @ObservedObject var userData = UserData.shared

    func baseOverlayColor(height: CGFloat) -> Color {
            Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68)
        }
    var body: some View {
        VStack{
            Spacer()
            Text("Searching for people near you...")
                .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                .font(.system(size: 16, weight: .bold))
            Spacer()
            ZStack{
                CustomCircle(width: 465, height: 465, overlayColor: clicked ? Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68) : baseOverlayColor(height: 465))
                CustomCircle(width: 345, height: 345, overlayColor: clicked ? Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68).opacity(0.8) : baseOverlayColor(height: 345))
                CustomCircle(width: 243, height: 243, overlayColor: clicked ? Color(red: 5/255, green: 30/255, blue: 88/255, opacity: 0.68).opacity(0.6) : baseOverlayColor(height: 243))
                Ellipse()
                    .fill(Color(red: 63/255, green: 49/255, blue: 120/255))
                    .shadow(color: Color.black.opacity(0.70), radius: 50, x: 0, y: 10)
                    .frame(width: 180, height: 180)
                    .onTapGesture {
                        withAnimation {
                            self.clicked.toggle()
                        }
                        Task {
                               await locationManager.requestLocationAsync() // Assuming requestLocationAsync is the correct method name
                           }
                    }
                
                
                VStack{
                    Text("Tap to find")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    Text("People near you")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            Spacer()
            HStack{
                Image("Home")
                    .onTapGesture{
                        gotoHome = true
                    }
                Spacer()
                Image("user")
            }
            .padding(15)
            
        }
        .navigationDestination(isPresented: $gotoHome) {
            ScanView()
        }
        .navigationDestination(isPresented: $userData.getSucess) {
                    NearbyView()
        }
        .onChange(of: locationManager.lastLocation) { newLocation in
            guard let location = newLocation else { return }
            ScanService.shared.findNearbyUsers(location: location) { result in
                switch result {
                case .success(let users):
                    self.nearbyUsers = users
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
       
}


struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
//--------------

private var delegateAssociationKey: UInt8 = 0

extension CLLocationManager {
    func requestLocation() async throws -> CLLocation {
        return try await withCheckedThrowingContinuation { continuation in
            let proxyDelegate = ProxyDelegate { location, error in
                if let location = location {
                    continuation.resume(returning: location)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: CLLocationManagerError.unknownError)
                }
                objc_setAssociatedObject(self, &delegateAssociationKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) // Clear the association when done
            }
            
            // Associate the proxy delegate with the location manager to keep it alive
            objc_setAssociatedObject(self, &delegateAssociationKey, proxyDelegate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            self.delegate = proxyDelegate
            self.requestLocation() // Call the original requestLocation method
        }
    }
}


enum CLLocationManagerError: Error {
    case unknownError
}

private class ProxyDelegate: NSObject, CLLocationManagerDelegate {
    let handler: (CLLocation?, Error?) -> Void
    
    init(handler: @escaping (CLLocation?, Error?) -> Void) {
        self.handler = handler
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        handler(locations.first, nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        handler(nil, error)
    }
}

//----------

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var getSucess: Bool = false
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }

    func requestLocationAsync() async {
            do {
                let location = try await locationManager.requestLocation()
                DispatchQueue.main.async {
                    self.lastLocation = location
//                    self.getSucess = true
                }
            } catch {
                DispatchQueue.main.async {
                    self.getSucess = false
                    // handle error
                }
            }
        }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.first
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

//struct ScanModel: Codable {
//    let id: String
//    let name: String
//    let distance: Double
//}

struct ScanModel: Decodable {
    let location: Location
    let username: String
    let tictok: String
    let instagram: String
    let facebook: String
    let snapchat: String
    let email: String
}

struct Location: Decodable {
    let lon: Double
    let lat: Double
}


class ScanService {

//    let uData = UserData()
    let email = UserData.shared.email
    var userData = UserData.shared.users
    
    static let shared = ScanService()
    let baseURL = "http://192.168.105.94:5000/api/users" // Replace with your actual server URL

    func findNearbyUsers(location: CLLocation, completion: @escaping (Result<[ScanModel], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/nearby-users")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "location": [
                "lat": location.coordinate.latitude,
                "lon": location.coordinate.longitude
            ],
            "email" : email
        ]
        print("#$#$#$", body)
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                // Assuming your server returns JSON with an array of user data
                let users = try JSONDecoder().decode([ScanModel].self, from: data)
                print("#$%%%%-----2", users)
                completion(.success(users))
                UserData.shared.users = users
                UserData.shared.getSucess = true
                self.userData = users
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
