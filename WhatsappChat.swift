public protocol ChatSystem {
    var username: String { get }
    var about: About { get }
    func sendMsgToContact(person: Contact, message: String) throws -> String 
    func sendMsgToNumber(number: String, message: String) throws -> String 
}

public enum Contact {
    case shoeb, nafees, shadab, zeehshan
}

public enum WhatsappError: Error {
    case msgIsEmpty, numberIsIncorrect
}

public enum About {
    case busy, available, whatsappOnly, atWork
}

public enum Emoji {
    case 👍, 😂, 😍, 😨, 😡
}

public final class Whatsapp: ChatSystem {
    
    public var setting: Setting
    public var username: String {
        setting.username
    }
    
    public var about: About
    
    init(username: String, about: About) {
        self.about = about
        self.setting = Setting(username: username)
    }
    
    public func sendingMsg(To contact: Contact, message: String) throws -> String  {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        return message
    }
    
    func broadcast(To contacts: [Contact], message: String) throws -> String {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        return message
    }
    
    public func sendingMsg(To number: String, message: String) throws -> String {
        if (number.count != 10 ) {
            throw WhatsappError.numberIsIncorrect
        } 
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        return message
    }
    
    func sendingEmojis(To number: Contact, emoji: [Emoji]) throws -> Any {
        if emoji.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        return emoji
    }
    
    func sendingContacts(To number: Contact, contact: Contact) {
        print("Sent")
    }
    
    func changeUsername(username: String) {
        setting.changeUsername(username: username)
    }
}

public final class Setting {
    public var username: String
    
    init(username: String) {
        self.username = username
    }
    
    func changeUsername(username: String) {
        self.username = username
    }
}

