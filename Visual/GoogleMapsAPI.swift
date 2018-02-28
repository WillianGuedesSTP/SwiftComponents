//
//  GoogleMapsAPI.swift
//  Sniff
//  Bundle Class
//
//  Created by Willian Guedes da Silva Cunha on 23/01/18.
//

import Foundation
import GooglePlaces
import GoogleMaps

class GMaps{
    
    /** Function - getCurrentLocationInString
     *  Função cujo o prosposito é capturar a localização atual do usuario
     *  @param  : LocationMAnager
     *  @return : [String:String], com latitude, longitude, message e status
     *
     *  #Resumo
     *  A funcao necessita ser alimentada pelo Location Manager, logo esta lhe retornara
     *  um dicionario de informacoes basicas, tais como a latitude, longitude e mensagens de
     *  validacao para serem exibidas ao usuario.
     */
    
    func getCurrentLocationInString(_ locationManager: CLLocationManager) -> [String:String]{
        var location: CLLocation!
        var locationInfo : [String:String] = [
            "latitude": "",
            "longitude": "",
            "message": "",
            "status": ""
        ]
        
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                locationInfo["message"] = "Sem acesso ao GPS :("
                locationInfo["status"] = "false"
                return locationInfo
            case .authorizedAlways, .authorizedWhenInUse:
                if CLLocationManager.locationServicesEnabled()  {
                    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                    locationManager.startUpdatingLocation()
                    location = locationManager.location
                    locationInfo["latitude"] = "\(location.coordinate.latitude)"
                    locationInfo["longitude"] = "\(location.coordinate.longitude)"
                    locationInfo["message"] = "Acesso concedido"
                    locationInfo["status"] = "true"
                    return locationInfo
                }else{
                    locationInfo["status"] = "false"
                    return locationInfo
                }
        }
        
    }
    
    /** Function - convertCoordinatesIntoHumanAddress
     *  @param:  Latitude e Longitude em String, e uma funcao de retorno
     *  @return: Funcao, que recebe uma String
     *
     *  #Resumo
     *  Esta função recebera uma altitude e longitude em String, e retornara uma Função assincrona com os
     *  parametros convertidos e concatenados, em uma unica String, para enderecos humanos.
     */
    
    func convertCoordinatesIntoAddress(latitude: String, longitude: String, _ receiver: @escaping(String)-> Void ){
        
        if(!latitude.isEmpty || longitude.isEmpty){
            let coordinateLatitude = Double(latitude)
            let coordinateLongitude = Double(longitude)
            
            let coordinates = CLLocationCoordinate2D(latitude:coordinateLatitude!, longitude:coordinateLongitude!)
            let geoCoder = GMSGeocoder()
            
            geoCoder.reverseGeocodeCoordinate(coordinates) { response, error in
                if let address = response?.firstResult() {
                    var completeAddress = address.lines![1] + " - " + address.country!
                    receiver(completeAddress)
                }else{
                    receiver("Localização não encontrada")
                }
            }
            
        }else{
            receiver("Sem acesso ao GPS :(")
        }
        
    }
    
    /** Function - coordinatesToCLLocation
     *  @param: Latitude(String) e Longitude(String)
     *  @return: location(CLLocation)
     *
     *  #Resumo
     *  Esta função recebera a latitude e longitude, e criará um objeto CLLocation.
     */
    
    func coordinatesToCLLocation(latitude: String, longitude: String) -> CLLocation{
        var location: CLLocation = CLLocation(latitude: CLLocationDegrees(latitude)!, longitude: CLLocationDegrees(longitude)!)
        return location
    }
    
}
