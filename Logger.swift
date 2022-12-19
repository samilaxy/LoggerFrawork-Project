//
//  Logger.swift
//  LoggerFrawork-Project
//
//  Created by Noye Samuel on 11/12/2022.
//

import Foundation

class Logger {
    static let shared = Logger(environment: .debugging)
    private var environment: Environment = .debugging
    private var dateFormat: String
    private var userID: String
    private var session: String
    private var tags: [String]
    private init(environment: Environment, dateFormat: String = "yyyy-MM-dd HH:mm:ss"){
        self.environment = environment
        self.dateFormat = dateFormat
        self.userID = ""
        self.session = ""
        self.tags = []
    }
    func log(_ message: String, severity: Severity = .veryLow) {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: Date.now)
        var logMessage = "[\(String(describing: date))]:[\(severity)]:[\(message)]"
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
    }
    func veryHigh(_ message: String){
        log(message, severity: .veryHigh)
    }
    func high(_ message: String){
        log(message, severity: .high)
    }
    func moderate(_ message: String){
        log(message, severity: .moderate)
    }
    func loe(_ message: String){
        log(message, severity: .low)
    }
    func veryLow(_ message: String){
        log(message, severity: .veryLow)
    }
    func configure(userID: String, session: String, environment: Environment){
        setUserID(userID: userID)
        setSession(session: session)
        setEnvironment(environment: environment)
    }
    func setUserID(userID: String){
        self.userID = userID
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
