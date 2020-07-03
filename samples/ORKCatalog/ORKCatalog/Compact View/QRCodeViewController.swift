//
//  QRCodeViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/03.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {
    
    @IBOutlet weak var qrDataString: UITextField!
    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var correctionLevelField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set data to qrDataString
        let defaults = UserDefaults.standard
        let qrData = defaults.string(forKey: "qrData")
        qrDataString.text = qrData
        self.textFieldDidChange()
        
        // Do any additional setup after loading the view.
        qrDataString.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControl.Event.editingChanged)
        correctionLevelField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    enum InputCorrectionLevel: String {
        case L
        case M
        case Q
        case H
    }

    private var QRImage: UIImage? {
        guard let qrData = qrDataString.text,
            let correctionLevelString = correctionLevelField.text,
            let correctionLevel = InputCorrectionLevel(rawValue: correctionLevelString) else { return nil }
        let data = qrData.data(using: .utf8)!

        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": correctionLevel.rawValue])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = qr.outputImage!.transformed(by: sizeTransform)
        let image = UIImage(ciImage: qrImage)
        return image
    }

    @objc func textFieldDidChange() {
        qrImageView.image = QRImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
