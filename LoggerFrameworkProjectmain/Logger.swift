//
//  Logger.swift
//  LoggerFrameworkProjectmain
//
//  Created by Noye Samuel on 21/12/2022.
//

import Foundation

class Logger {
    static let shared = Logger(environment: .debugging)
     var logMessage = ""
     var environment: Environment = .debugging
     var dateFormat: String
     var userID: String
     var session: String
     var tags: [String]
     var date = ""
     init(environment: Environment, dateFormat: String = "yyyy-MM-dd HH:mm:ss"){
        self.environment = environment
        self.dateFormat = dateFormat
        self.userID = ""
        self.session = ""
        self.tags = []
    }
    func log(_ message: String, severity: Severity = .veryLow)-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        date = formatter.string(from: Date.now)
        logMessage = "[\(String(describing: date))]:[\(severity)]:[\(message)]"
        if !session.isEmpty {
            logMessage += " [\(session)]"
        }
        if !tags.isEmpty {
            logMessage += " [\(tags.joined(separator: ","))]"
        }
        switch environment {
        case .debugging:
            debugPrint(logMessage)
            break
        case .production:
            // TODO: log this to file instead of printing
            saveLogToFile(logMessage)
            break
        case .staging:
            print(logMessage )
            break
        }
        return logMessage
    }
    
    func severity(_ message: String, severity: Severity) -> String {
        
        var severityLog = ""
        
        switch severity {
        case .veryHigh:
            severityLog =  log(message, severity: .veryHigh)
        case .high:
            severityLog =  log(message, severity: .high)
        case .moderate:
            severityLog =  log(message, severity: .moderate)
        case .low:
            severityLog =  log(message, severity: .low)
        case .veryLow:
            severityLog = log(message, severity: .veryLow)
        }
        
        return severityLog
    }
    
    func configure(userID: String, session: String, environment: Environment){
        setUserID(userID: userID)
        setSession(session: session)
        setEnvironment(environment: environment)
    }
    func setUserID(userID: String) -> String {
        self.userID = userID
        return userID
    }
    func setDateFormat(dateFormat: String) {
        self.dateFormat = dateFormat
    }
    func setEnvironment(environment: Environment) {
        self.environment = environment
    }
    func setSession(session: String) {
        self.session = session
    }
    func addTag(tag: String) {
        self.tags.append(tag)
    }
    // MARK: File Management
    private func saveLogToFile(_ message: String) {
        // Use FileManager to create a new file and write the log string to it
    }
    // MARK: Firebase
    private func pushLogToFirebase(logString: String) {
        // Use Firebase SDK to authenticate with Firebase and upload the log string to a designated storage location
    }
    enum Severity {
        case veryHigh
        case high
        case moderate
        case low
        case veryLow
    }
    enum Environment {
        case debugging
        case staging
        case production
    }
}
