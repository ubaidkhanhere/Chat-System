public protocol ChatSystem {
    var userName: String { get }
    var about: About { get }
    func sendMsgToContact(person: Contact, message: String) throws -> String 
    func sendMsgToNumber(number: String, message: String) throws -> String 
}

public enum Contact {
    case shoeb, nafees, shadab, zeehshan
}

enum WhatsappError: Error {
    case msgIsEmpty, numberIsIncorrect
}

public enum About {
    case busy, available, whatsappOnly, atWork
}

public final class Whatsapp: ChatSystem {
    public var userName: String
    public var about: About
    
    init(userName: String, about: About) {
        self.userName = userName
        self.about = about
    }
    
    public func sendMsgToContact(person: Contact, message: String) throws -> String  {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        return message
    }
    
    func broadcasttoContact(person: [Contact], message: String) throws -> String {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        return message
    }
    
    public func sendMsgToNumber(number: String, message: String) throws -> String {
        if (number.count != 10 ) {
            throw WhatsappError.numberIsIncorrect
        } 
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        return message
    }
}
