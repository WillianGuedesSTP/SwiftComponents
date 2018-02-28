//
//  ImageStyles.swift
//  Antena1
//
//  Created by Willian Guedes da Silva Cunha  on 21/02/18.
//

import Foundation
import UIKit

class ImageTools : UIViewController {
    
    /* Name: makeShadows
     * Main Action: Make shadow effect over a UIView.
     * @Parameters: This function need, apart from view(UIView), the opacity(Double), radious(Double), and the size (width and heigth)
     * @Return: This function returns the same view, with modified layer.
     */
    
    class func makeShadows(_ view: UIView, opacity: Double, radius: Double, width: Double, heigth: Double) -> UIView{
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = Float(opacity)
        view.layer.shadowOffset = CGSize(width: width, height: heigth)
        view.layer.shadowRadius = CGFloat(radius)
        return view
    }
    
    /* Name: urlToImage
     * Main: Convert URL to Image Object
     * @parameters: Your ImageView and your target URL
     * @return: Return the same view with, a downloaded image
     */
    
    class func urlToImage(url: String, view: UIImageView) -> UIImageView{
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!)
        view.image = UIImage(data: data!)
        return view
    }
    
    /* Name: urlToData
     * Main: Convert URL to base64 data object
     * @parameters: Target Url
     * @return: base64 image String
     */
    
    class func urlToData(url: String) -> String{
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!)
        let strBase64 = data?.base64EncodedData(options: .lineLength64Characters)
        return String(describing: strBase64!)
    }
    
    /* Name: imageEncoding
     * Main: Convert Image Object to base64 data String
     * @parameter: Target Image
     * @return: base64 String or error message
     */
    
    class func imageToData(image: UIImage) -> String{
        let jpegCompressionQuality: CGFloat = 0.1
        if let base64String = UIImageJPEGRepresentation(image, jpegCompressionQuality)?.base64EncodedString() {
            print(base64String)
            return base64String
        }else{
            return "Encoding Error"
        }
    }
}
