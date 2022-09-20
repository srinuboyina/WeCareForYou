//
//  AutofillAddress.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import MapKit
import Contacts

typealias address = (city: String, state: String, country: String)

struct Geocode {
        
    /// Auto populate Address on enter zipCode
    func zipToAddress(zip: String,
                      onSuccess: @escaping (address) -> (),
                      onFail: @escaping (_ err: Error?) -> Void) {
        let geocoder = CLGeocoder()
        let postalAddress = CNMutablePostalAddress()
        postalAddress.postalCode = zip
        geocoder.geocodePostalAddress(
            postalAddress,
            preferredLocale: Locale(identifier: "en_US")) { (placemarks, err) in
            if let placemark = placemarks, placemark.count > 0 {
                debugPrint(placemark)
                let firstPlace = placemark[0]
                onSuccess(getFullAddress(firstPlace))
                return
            }
            onFail(err)
        }
    }
    
    private func getFullAddress(_ firstPlace: CLPlacemark) -> address {
        let city = firstPlace.locality
        let state = firstPlace.administrativeArea
        let country = firstPlace.country
        return (city != nil ? city! : "", state != nil ? state! : "", country ?? "Not found")
    }
    
}


