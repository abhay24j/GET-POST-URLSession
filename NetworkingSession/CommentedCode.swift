//
//  CommentedCode.swift
//  NetworkingSession
//
//  Created by Abhishek Sinha on 01/05/22.
//

import Foundation
//            if let _ = urlResponse as? HTTPURLResponse {
//
//                if let responseData = data {
//                    if let user: User = try? JSONDecoder().decode(User.self, from: responseData) {
//                        self.userArray.append(user)
//                        DispatchQueue.main.async {
//                            self.userTableView.reloadData()
//                        }
//                    }
//                }
//            }
            
            




// ** -->> we can get the information without using Codable


//    func readFile(fileName: String, type: String) {
//        self.dispatchGroup.enter()
//        customQueue.async {
//            if let path = Bundle.main.path(forResource: fileName, ofType: type) {
//                print("Started Reading from file \(fileName)")
//
//                do {
//
//                      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                    if let userArray: [User] = try? JSONDecoder().decode([User].self, from: data) {
//                        print("Reading of data fom file \(fileName) is done ")
//                        self.lock.wait()
//                        self.userArray.append(contentsOf: userArray)
//                        self.lock.signal()
//                        self.dispatchGroup.leave()
//                    }
//                    else { 
//                        self.dispatchGroup.leave()
//                    }
//                  } catch {
//                       // handle error
//                      print("exception occured while reading file \(fileName)")
//                      self.dispatchGroup.leave()
//                  }
//            }
//            else {
//                self.dispatchGroup.leave()
//            }
//        }
//    }





//                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                  if let jsonResult = jsonResult as? [Dictionary<String, AnyObject>] {
//                      for userObject in jsonResult {
//
//                          let id : Int = userObject["id"] as! Int
//                          let name : String = userObject["name"] as! String
//                          let email : String = userObject["email"] as! String
//                          let gender : String = userObject["gender"] as! String
//                          let status : String = userObject["status"] as! String
//
//                          let user = User(id: id, name: name, email: email, gender: gender, status: status)
//                          userArray.append(user)
//                      }
//
//                  }





/* let user1 = User(id: 1, name: "Abhay", email: "abhay@gmail.com", gender: "Male", status: "active")
let user2 = User(id: 2, name: "Abhishek", email: "abhishek@gmail.com", gender: "Male", status: "active")
let user3 = User(id: 3, name: "Aarav", email: "aarav@gmail.com", gender: "Male", status: "active")
let user4 = User(id: 4, name: "Abhijeet", email: "Abhijeet@gmail.com", gender: "Male", status: "active")
userArray.append(user1)
userArray.append(user2)
userArray.append(user3)
userArray.append(user4)
*/
