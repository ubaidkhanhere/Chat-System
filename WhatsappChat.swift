public protocol ChatSystem {
    var username: String { get }
    func sendingMsg(To number: String, message: String)
}
public final class Whatsapp: ChatSystem {
    
    public var username: String
    var history: [String] = []
    
    init(username: String) {
        self.username = username
    }
    
    public func sendingMsg(To number: String, message: String)  {
        history.append(message)
    }
}
