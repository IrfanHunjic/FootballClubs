//
//  NetworkManager.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 7. 11. 2021..
//

import Foundation
import Alamofire

enum LeagueError: Error {
    case noDataAvailable
    case canNotProcessData
}

class NetworkManager {
    var baseUrl = "https://api.football-data.org/v2/"
    let API_KEY = "8a1bdee0d4b14e4e94359f15797e0311"
    
    static let shared = NetworkManager()
    
    private var headers: HTTPHeaders {
        let headerDict = ["X-Auth-Token": API_KEY]
        return HTTPHeaders(headerDict)
    }
    
    private init() { }
    
    func getLeagues(completion: @escaping(Result<[League], LeagueError>) -> Void) {
        guard let url = URL(string: baseUrl.appending("competitions")) else { return }
        let params = ["plan": "TIER_ONE"]
        AF.request(url, method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: headers).responseData { response in
            guard let jsonData = response.data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let leaguesResponse = try decoder.decode(LeaguesResponseModel.self, from: jsonData)
                completion(.success(leaguesResponse.competitions))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
    }
    
    func getTeams(competitionId: Int, completion: @escaping(Result<[Team], LeagueError>) -> Void) {
        let urlString = "\(baseUrl)competitions/\(competitionId)/teams"
        guard let url = URL(string: urlString) else { return }
        AF.request(url, method: .get, headers: headers).responseData { response in
            guard let jsonData = response.data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let teamsResponse = try decoder.decode(TeamsResponse.self, from: jsonData)
                completion(.success(teamsResponse.teams))
            } catch(let error) {
                completion(.failure(.canNotProcessData))
            }
            
        }
    }
}

