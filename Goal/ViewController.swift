//
//  ViewController.swift
//  Goal
//
//  Created by RAjeev Singh on 27/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblList : UITableView!
    var array = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        getApiCall()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    func getApiCall() {
       
        APICommunicator.getData(APIConstants.APIName.contentList, headers: APIConstants.K_API_HEADERS, parameters: [:]) {[weak self] (response: AnyObject?, data: Data) in
            let jsonDecoder = JSONDecoder()
            if let arrData = response?["items"] as? [AnyObject] {
                print("arrData", arrData)
                if let jsonData = try? JSONSerialization.data(withJSONObject: arrData, options: .prettyPrinted) {
                    let codableObject = try? jsonDecoder.decode([Items].self, from: jsonData)
                    self?.array = codableObject ?? []
                    DispatchQueue.main.async {
                        self?.tblList.reloadData()
                    }
                    return;
                }
            }
            
        } onFailure: { (error: AnyObject?) in
            print("******** ERROR_1 ********\n\(String(describing: error))")
        }
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.width * 0.28
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentListCell") as! ContentListCell
        cell.item = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.item = array[indexPath.row]
        self.navigationController?.show(vc, sender: self)
    }
}

