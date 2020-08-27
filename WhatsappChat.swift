public protocol ChatSystem {
    var username: String { get }
    var about: About { get }
    func sendingMsg(To contact: Contact, message: String) throws 
    func sendingMsg(To number: String, message: String) throws 
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
    
    public func sendingMsg(To contact: Contact, message: String) throws  {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    func broadcast(To contacts: [Contact], message: String) throws {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    public func sendingMsg(To number: String, message: String) throws {
        if (number.count != 10 ) {
            throw WhatsappError.numberIsIncorrect
        } else if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    func sendingEmojis(To number: Contact, emoji: [Emoji]) throws {
        if emoji.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    func sendingContacts(To number: Contact, contact: Contact) {
        print("Sent")
    }
    
    func changeUsername(username: String) {
        setting.changeUsername(username: username)
        print("Username has been changed")
    }
}

public final class Setting {
    public var username: String
    
    init(username: String) {
        self.username = username
    }
    
    func changeUsername(username: String) {
        self.username = username
        print("Username has been changed")
    }
}
