/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Rounds : Codable {
	let id : String?
	let number : String?
	let id_league : String?
	let league : String?
	let season_id : String?
	let id_season : String?
	let date : String?
	let type : String?
	let is_ignored_on_table : String?
	let is_ignored_in_scorers : String?
	let order : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case number = "number"
		case id_league = "id_league"
		case league = "league"
		case season_id = "season_id"
		case id_season = "id_season"
		case date = "date"
		case type = "type"
		case is_ignored_on_table = "is_ignored_on_table"
		case is_ignored_in_scorers = "is_ignored_in_scorers"
		case order = "order"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		number = try values.decodeIfPresent(String.self, forKey: .number)
		id_league = try values.decodeIfPresent(String.self, forKey: .id_league)
		league = try values.decodeIfPresent(String.self, forKey: .league)
		season_id = try values.decodeIfPresent(String.self, forKey: .season_id)
		id_season = try values.decodeIfPresent(String.self, forKey: .id_season)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		is_ignored_on_table = try values.decodeIfPresent(String.self, forKey: .is_ignored_on_table)
		is_ignored_in_scorers = try values.decodeIfPresent(String.self, forKey: .is_ignored_in_scorers)
		order = try values.decodeIfPresent(String.self, forKey: .order)
	}

}