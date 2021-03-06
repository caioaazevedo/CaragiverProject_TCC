//
//  Event.swift
//  CaregiverProject
//
//  Created by Caio Azevedo on 27/04/21.
//

import UIKit

enum CategoryType: String {
    case Health
    case Fun
    case Dentist
    case Pharmacy
    case Food
    case Others
    
    var color: UIColor {
        switch self {
        case .Health:
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case .Fun:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case .Dentist:
            return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case .Pharmacy:
            return #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        case .Food:
            return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        case .Others:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
}

struct EventModel {
    var id: String = ""
    var title: String?
    var local: String?
    var category: CategoryType?
    var time: String?
    var date: Date?
    var responsible: Member?
    var notes: String?
}

extension EventModel: Storable {
    static var queryValue: String {
        EntityTypes.Event.rawValue
    }
    
    var convertedDictionary: [String : Any] {
        let categoryString = category?.rawValue
        return [
            "title": title ?? "",
            "local": local ?? "",
            "category": categoryString ?? "",
            "time": time ?? "",
            "date": date?.formatDate() ?? "",
            "responsible": (responsible?.convertedDictionary ?? [:]) as NSDictionary,
            "notes": notes ?? ""
        ]
    }
    
    init(id: String, dictionary: NSDictionary) {
        self.id = id
        self.title = dictionary["title"] as? String
        self.local = dictionary["local"] as? String
        let categoryString = dictionary["category"] as? String
        self.category = CategoryType(rawValue: categoryString ?? "")
        self.time = dictionary["time"] as? String
        if let memberDict = dictionary["responsible"] as? NSDictionary,
           let memberID = memberDict["uid"] as? String {
            self.responsible = Member(id: memberID, dictionary: memberDict)
        }
        let dateString = dictionary["date"] as? String ?? ""
        self.date = dateString.formatToDate()
        self.notes = dictionary["notes"] as? String
    }
}

extension EventModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
}
