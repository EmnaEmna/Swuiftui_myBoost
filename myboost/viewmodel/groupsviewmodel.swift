
import Foundation
import  Alamofire
import Combine
import CoreData
import SwiftUI
import SwiftyJSON
//list test script/*
/*
class GroupsViewModel : ObservableObject {
    @Published var groups = [GroupModel]()
    private let baseURL = "http://localhost:9090/"
    init (){
        AF.request("http://localhost:9090/api/group/getgroups",
                       method: .post,
                       parameters: [ "email" : "haythem@mail.test" ],
                       encoding: JSONEncoding.default)
            .responseData {
                (groups) in
                let json = try! JSON(data : groups.data!)
                for i in json{
                    self.groups.append(GroupModel(id: i.1["_id"].stringValue, name:  i.1["name"].stringValue, year:  i.1["year"].stringValue, classroom:  i.1["classroom"].stringValue, user:  i.1["user"].stringValue, emails: i.1["emails"].rawValue as! [String] ))
                }
                print(self.groups)
            }
    }
}*/
