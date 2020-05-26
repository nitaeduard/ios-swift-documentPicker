//
//  ViewController.swift
//  FileImport
//
//  Created by Eduard Nita on 26/05/2020.
//  Copyright © 2020 Eduard Nita. All rights reserved.
//

import UIKit
import CoreServices

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPresed() {
        open(fileTypes: [kUTTypeItem as String])
    }
    
    @IBAction func pdfOuttonPresed() {
        open(fileTypes: [kUTTypePDF as String])
    }
    
    @IBAction func imageButtonPresed() {
        open(fileTypes: [kUTTypeImage as String])
    }
    
    @IBAction func docButtonPresed() {
        open(fileTypes: ["com.microsoft.word.doc", "org.openxmlformats.wordprocessingml.document"])
    }
    
    func open(fileTypes: [String]) {
        let docVC = UIDocumentBrowserViewController(forOpeningFilesWithContentTypes: fileTypes)
        docVC.allowsDocumentCreation = false
        docVC.allowsPickingMultipleItems = false
        docVC.delegate = self
        self.show(docVC, sender: self)
    }

}

extension ViewController: UIDocumentBrowserViewControllerDelegate {

    func documentBrowser(_ controller: UIDocumentBrowserViewController, didPickDocumentsAt documentURLs: [URL]) {
        controller.dismiss(animated: true) {
            self.label.text = documentURLs.first?.absoluteString ?? "none"
        }
    }
}

