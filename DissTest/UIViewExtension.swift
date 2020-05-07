//
//  UIViewExtension.swift
//  DissTest
//
//  Created by Owen Malcolmson-Priest on 10/04/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
      // Export pdf from Save pdf in drectory and return pdf file path
    func exportAsPdfFromView(name: String) -> String {
            var filename = name
            filename += ".pdf"
            let pdfPageFrame = self.bounds
            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, pdfPageFrame, nil)
            UIGraphicsBeginPDFPageWithInfo(pdfPageFrame, nil)
            guard let pdfContext = UIGraphicsGetCurrentContext() else { return "" }
            self.layer.render(in: pdfContext)
            UIGraphicsEndPDFContext()
        
        return self.saveViewPdf(data: pdfData, name: filename)
            
        }
        
        // Save pdf file in document directory
    func saveViewPdf(data: NSMutableData, name: String) -> String {
           
        var fileName = name
        fileName += ".pdf"
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let docDirectoryPath = paths[0]
            let pdfPath = docDirectoryPath.appendingPathComponent(fileName)
            if data.write(to: pdfPath, atomically: true) {
                return pdfPath.path
            } else {
                return ""
            }
        }
    }
    
//https://www.swiftdevcenter.com/create-pdf-from-uiview-wkwebview-and-uitableview/
