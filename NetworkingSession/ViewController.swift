//
//  ViewController.swift
//  NetworkingSession
//
//  Created by Abhay Kumar 06/05/22

/// CRUD -> Create,Read, Update and Delete
///  REST - Resprestationa State Transfer protocol
///  /get/ -> read
///  post/ -> Create
///  put/-> Update
///  delete-> Delete

import UIKit
struct User : Codable {
    let id: Int
    let name : String?
    let email : String?
    let gender : String?
    let status : String?
}
class ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    var userArray = [User]()
    let lock = DispatchSemaphore(value: 1)
    let dispatchGroup = DispatchGroup()
    let operationQueue = OperationQueue()
    let customQueue = DispatchQueue.init(label: "customQueue", qos: .background,attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupDate()
//        self.dispatchGroup.notify(queue: .main) {
//            print("Reading of all files are completed , now loading table view")
//            self.userTableView.reloadData()
//        }
//        print("Setup Data Completed")
        readData(fromURLStr: "https://gorest.co.in/public/v2/users")
    }

    
//    func setupDate() {
//       readData(fromURLStr: "https://gorest.co.in/public/v2/users")
//    }
//
    func readData(fromURLStr : String) {
        guard let url : URL = URL(string: fromURLStr) else {
            print("Unable to create url from string -->> \(fromURLStr)")
            return
        }
        // 2. create url request
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
////        urlRequest.addValue("Bearer 7ac80325b16a21741993b2a7d7abaa1df48503016171d0a9b79d89cfe950c7e8", forHTTPHeaderField: "Authorization")
        
        //3. session data task
        let session = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            
            if let errorExist = error {
                print("Error has occurred while accessing the url -> \(fromURLStr) for error \(errorExist.localizedDescription)")
                return
            }
            if let response = urlResponse as? HTTPURLResponse {
                if(response.statusCode == 200) {
                    print("request has successfully executed")
                }
                if let responseData = data {
                    if let userArray: [User] = try? JSONDecoder().decode([User].self, from: responseData) {
                        self.userArray = userArray
                        DispatchQueue.main.async {
                            self.userTableView.reloadData()
                        }
                    }
                }
            }
            

        }
        session.resume()
      }
    
    @IBAction func createNewEntry(_ sender: Any) {
        let headerParams = ["Accept" : "application/json",
                            "Content-Type": "application/json",
                            "Authorization" : "Bearer 7ac80325b16a21741993b2a7d7abaa1df48503016171d0a9b79d89cfe950c7e8"]
        
        let postParams = ["name" : "sonu Verma1",
                          "status" : "active",
                          "email" : "abhi.vr1.asdsa@gmail.com",
                          "gender" :"male"]
        
        createNewUser(urlStr: "https://gorest.co.in/public/v2/users", postParam: postParams, headerParams: headerParams)
    }
    
    func createNewUser(urlStr : String, postParam: [String: String], headerParams : [String: String]) {
        
        guard let url : URL = URL(string: urlStr) else {
            return
        }
        
        var request = URLRequest(url: url)
        if let jsonData = try? JSONSerialization.data(withJSONObject: postParam) {
            request.httpBody = jsonData
        }
        for (key,value) in headerParams {
            request.addValue(value, forHTTPHeaderField: key)
        }
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if let errorExist = error {
                print("Error has occurred while accessing the url -> \(urlStr) for error \(errorExist.localizedDescription)")
                return
            }
            self.readData(fromURLStr: urlStr)

        }.resume()
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let user = userArray[indexPath.row]
        
        
        if let name = user.name {
            cell.name.text = name
            cell.name.isHidden = false
        }
        else {
            cell.name.isHidden = true
        }
        cell.userId.text = String(user.id)
        if let status = user.status {
            cell.status.text = status
            cell.status.isHidden = false
        }
        else {
            cell.status.isHidden = true
        }
        if let gender = user.gender {
            cell.gender.text = gender
            cell.gender.isHidden = false
        }
        else {
            cell.gender.isHidden = true
        }
        if let email = user.email {
            cell.emailId.text = email
            cell.emailId.isHidden = false
        }
        else {
            cell.emailId.isHidden = true
        }
        return cell
    }
    
    
}
