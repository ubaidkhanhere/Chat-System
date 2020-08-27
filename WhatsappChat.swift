// This is protocol, set of rules where every chat system will have to apply.
public protocol ChatSystem {
    var username: String { get }
    var about: About { get }
    func sendingMsg(To contact: Contact, message: String) throws 
    func sendingMsg(To number: String, message: String) throws 
}

// This is Contact enum, where i defined some contacts here.
public enum Contact {
    case shoeb, nafees, shadab, zeehshan
}

// This is WhatsappError enum, where i defined some error names which throws when error catched.
public enum WhatsappError: Error {
    case msgIsEmpty, numberIsIncorrect
}

// This is predefined statements which gives your currect condition.
public enum About {
    case busy, available, whatsappOnly, atWork
}

// This is Emoji enum, where i defined some well known emojis here.
public enum Emoji {
    case 👍, 😂, 😍, 😨, 😡
}

// This is Whatsapp class where it impliments ChatSystem Protocol.
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
    
    // With the help of this function you can send message to your contact
    public func sendingMsg(To contact: Contact, message: String) throws  {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    // With the help of this function you can create broadcast message to your contacts.
    func broadcast(To contacts: [Contact], message: String) throws {
        if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    // With the help of this function you can send message to a particular number.
    public func sendingMsg(To number: String, message: String) throws {
        if (number.count != 10 ) {
            throw WhatsappError.numberIsIncorrect
        } else if message.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    // With the help of this function you can send emojis to your contacts.
    func sendingEmojis(To number: Contact, emoji: [Emoji]) throws {
        if emoji.isEmpty {
            throw WhatsappError.msgIsEmpty
        }
        print("Sent")
    }
    
    // With the help of this function you can send a particular contact to your contact.
    func sendingContacts(To number: Contact, contact: Contact) {
        print("Sent")
    }
    
    // With the help of this function you can change your username which is already initialised.
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
    
    // With the help of this function you can change your username which is already initialised.
    func changeUsername(username: String) {
        self.username = username
        print("Username has been changed")
    }
}
