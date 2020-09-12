public protocol ChatSystem {
    var username: String { get }
    func sendingMsg(To number: String, message: String)
}
public final class Whatsapp: ChatSystem {
    public var username: String
    var history: [String : [String]] = [:]
    
    init(username: String) {
        self.username = username
    }
    
    public func sendingMsg(To number: String, message: String)  {
        var msgs = history[number] ?? []
        msgs.append(message)
        history[number] = msgs
    }
}
