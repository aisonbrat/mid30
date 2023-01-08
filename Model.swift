//
//  Model.swift
//  MongoAPIPr
//
//  Created by Aisultan Zhaksytayev on 08.01.2023.
//

import Foundation

struct QuestionsData: Decodable {
    let questions: [Question]
    
    private enum CodingKeys: String, CodingKey {
        case questions = "results"
    }
}

struct Question: Decodable {
    let dependent: String?
    let question: String?
    let options: [String]?
    let answer: String?
    
    private enum CodingKeys: String, CodingKey {
        case dependent = "variant"
        case question = "question_text"
        case options = "variants_options"
        case answer = "correct_answer"
    }
}
