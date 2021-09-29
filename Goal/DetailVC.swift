//
//  DetailVC.swift
//  Goal
//
//  Created by RAjeev Singh on 27/09/21..
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var lblBody : UILabel!
    
    var item : Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(backButtonPressed))
        self.navigationItem.title = item?.title
        getDetailApi()
    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
   
    func getDetailApi() {
        
        APICommunicator.getData("\(APIConstants.APIName.detailApi)\(item?.id ?? 0).json", headers: APIConstants.K_API_HEADERS, parameters: [:]) {[weak self] (response: AnyObject?, data: Data) in
            if let data = response?["item"] as? [String:Any]  {
                DispatchQueue.main.async {
                    self?.lblBody.text = data["body"] as? String
                }
            }
        } onFailure: { (error: AnyObject?) in
            print("******** ERROR_1 ********\n\(String(describing: error))")
        }
    }
}
