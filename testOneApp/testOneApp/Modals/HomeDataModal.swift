//
//  HomeDataModal.swift
//  testOneApp
//
//  Created by Anika Tomichen on 26/07/20.
//  Copyright © 2020 Anika Tomichen. All rights reserved.
//

import Foundation

struct HomeDataModal:Decodable{
  var activity: HomeActivity?
  var steps: HomeSteps?
  var articles: [HomeArticlesList]?
}

struct HomeActivity: Decodable{
    var items: HomeActivityItems?
    var icon: String?
    var name: String?
}

struct HomeActivityItems: Decodable{
    var move: Int?
    var exercise: Int?
    var stand: Int?
}

struct HomeSteps: Decodable{
    var value: Int?
    var icon: String?
    var name: String?
}

struct HomeArticlesList:Decodable{
    var heading: String?
    var subheading: String?
    var image: String?
}


struct AllDataModel: Decodable{
    var standHours: StandHours?
    var activeEnergy: ActiveEnergy?
    var heartRate: HeartRate?
    var soundLevels: SoundLevels?
    var sleepHours: SleepHours?
}

struct StandHours:Decodable{
    var value: Int?
    var icon: String?
    var name: String?
}

struct ActiveEnergy: Decodable{
    var value: Int?
    var icon: String?
    var name: String?
}

struct HeartRate: Decodable{
    var value: Int?
    var icon: String?
    var name: String?
}

struct SoundLevels: Decodable{
    var value: Int?
    var icon: String?
    var iconOK: String?
    var iconError: String?
    var name: String?
}

struct SleepHours: Decodable{
    var hour: Int?
    var minutes: Int
    var icon: String?
    var name: String?
}
