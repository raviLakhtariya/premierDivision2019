/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Seasons : Codable {
	let id : String?
	let id_league : String?
	let name : String?
	let league_name : String?
	let champions_league : String?
	let downgrade : String?
	let europa_league : String?
	let preliminaries : String?
	let downgrade_playoff : String?
	let start_date : String?
	let has_scorers : String?
	let has_relegation : String?
	let number_of_regular_rounds : String?
	let number_of_teams_in_playoff : String?
	let split_points : String?
	let ignore_regular_statistics_in_playoff : String?
	let is_tie_criteria_victories : String?
	let second_tie_criteria : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case id_league = "id_league"
		case name = "name"
		case league_name = "league_name"
		case champions_league = "champions_league"
		case downgrade = "downgrade"
		case europa_league = "europa_league"
		case preliminaries = "preliminaries"
		case downgrade_playoff = "downgrade_playoff"
		case start_date = "start_date"
		case has_scorers = "has_scorers"
		case has_relegation = "has_relegation"
		case number_of_regular_rounds = "number_of_regular_rounds"
		case number_of_teams_in_playoff = "number_of_teams_in_playoff"
		case split_points = "split_points"
		case ignore_regular_statistics_in_playoff = "ignore_regular_statistics_in_playoff"
		case is_tie_criteria_victories = "is_tie_criteria_victories"
		case second_tie_criteria = "second_tie_criteria"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		id_league = try values.decodeIfPresent(String.self, forKey: .id_league)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		league_name = try values.decodeIfPresent(String.self, forKey: .league_name)
		champions_league = try values.decodeIfPresent(String.self, forKey: .champions_league)
		downgrade = try values.decodeIfPresent(String.self, forKey: .downgrade)
		europa_league = try values.decodeIfPresent(String.self, forKey: .europa_league)
		preliminaries = try values.decodeIfPresent(String.self, forKey: .preliminaries)
		downgrade_playoff = try values.decodeIfPresent(String.self, forKey: .downgrade_playoff)
		start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
		has_scorers = try values.decodeIfPresent(String.self, forKey: .has_scorers)
		has_relegation = try values.decodeIfPresent(String.self, forKey: .has_relegation)
		number_of_regular_rounds = try values.decodeIfPresent(String.self, forKey: .number_of_regular_rounds)
		number_of_teams_in_playoff = try values.decodeIfPresent(String.self, forKey: .number_of_teams_in_playoff)
		split_points = try values.decodeIfPresent(String.self, forKey: .split_points)
		ignore_regular_statistics_in_playoff = try values.decodeIfPresent(String.self, forKey: .ignore_regular_statistics_in_playoff)
		is_tie_criteria_victories = try values.decodeIfPresent(String.self, forKey: .is_tie_criteria_victories)
		second_tie_criteria = try values.decodeIfPresent(String.self, forKey: .second_tie_criteria)
	}

}