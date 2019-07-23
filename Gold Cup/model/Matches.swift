/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Matches : Codable {
	let homeTeamID : String?
	let awayTeamID : String?
	let id : String?
	let date : String?
	let matchStatus : String?
	let flag : String?
	let homeGoals : String?
	let awayGoals : String?
	let homePenaltyGoals : String?
	let awayPenaltyGoals : String?
	let stage : String?
	let videoUrl : String?
	let tvPost : String?
	let liveMinute : String?
	let homeOdd : String?
	let awayOdd : String?
	let drawOdd : String?
	let scorers : [Scorers]?

	enum CodingKeys: String, CodingKey {

		case homeTeamID = "homeTeamID"
		case awayTeamID = "awayTeamID"
		case id = "id"
		case date = "date"
		case matchStatus = "matchStatus"
		case flag = "flag"
		case homeGoals = "homeGoals"
		case awayGoals = "awayGoals"
		case homePenaltyGoals = "homePenaltyGoals"
		case awayPenaltyGoals = "awayPenaltyGoals"
		case stage = "stage"
		case videoUrl = "videoUrl"
		case tvPost = "tvPost"
		case liveMinute = "liveMinute"
		case homeOdd = "homeOdd"
		case awayOdd = "awayOdd"
		case drawOdd = "drawOdd"
		case scorers = "scorers"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		homeTeamID = try values.decodeIfPresent(String.self, forKey: .homeTeamID)
		awayTeamID = try values.decodeIfPresent(String.self, forKey: .awayTeamID)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		matchStatus = try values.decodeIfPresent(String.self, forKey: .matchStatus)
		flag = try values.decodeIfPresent(String.self, forKey: .flag)
		homeGoals = try values.decodeIfPresent(String.self, forKey: .homeGoals)
		awayGoals = try values.decodeIfPresent(String.self, forKey: .awayGoals)
		homePenaltyGoals = try values.decodeIfPresent(String.self, forKey: .homePenaltyGoals)
		awayPenaltyGoals = try values.decodeIfPresent(String.self, forKey: .awayPenaltyGoals)
		stage = try values.decodeIfPresent(String.self, forKey: .stage)
		videoUrl = try values.decodeIfPresent(String.self, forKey: .videoUrl)
		tvPost = try values.decodeIfPresent(String.self, forKey: .tvPost)
		liveMinute = try values.decodeIfPresent(String.self, forKey: .liveMinute)
		homeOdd = try values.decodeIfPresent(String.self, forKey: .homeOdd)
		awayOdd = try values.decodeIfPresent(String.self, forKey: .awayOdd)
		drawOdd = try values.decodeIfPresent(String.self, forKey: .drawOdd)
		scorers = try values.decodeIfPresent([Scorers].self, forKey: .scorers)
	}

}