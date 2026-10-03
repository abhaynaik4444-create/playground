import Foundation

struct AngelNumber: Identifiable, Hashable {
    let number: String
    let meaning: String

    var id: String { number }

    static let all: [AngelNumber] = [
        .init(number: "111", meaning: "Your thoughts are manifesting quickly. Focus on what you truly want."),
        .init(number: "222", meaning: "Trust the process. Balance and harmony are on their way."),
        .init(number: "333", meaning: "You are supported and creative energy surrounds you."),
        .init(number: "444", meaning: "You are protected and on the right path. Keep building."),
        .init(number: "555", meaning: "Big change is coming. Embrace it with an open heart."),
        .init(number: "666", meaning: "Rebalance your thoughts. Return focus to love and gratitude."),
        .init(number: "777", meaning: "Luck and spiritual alignment. You're doing something right."),
        .init(number: "888", meaning: "Abundance and prosperity are flowing toward you."),
        .init(number: "999", meaning: "A chapter is closing. Let go to make room for the new."),
        .init(number: "000", meaning: "A fresh start. Infinite potential lies ahead."),
        .init(number: "1111", meaning: "A powerful wake-up call. Make a wish and set an intention."),
        .init(number: "1212", meaning: "Stay positive. Your goals are closer than you think."),
        .init(number: "1234", meaning: "Take the next step. Progress is happening one move at a time."),
        .init(number: "2222", meaning: "Have faith. Your efforts are coming together."),
        .init(number: "3333", meaning: "Ascended masters are near. Speak your truth."),
        .init(number: "4444", meaning: "Angels surround you with strength and stability."),
        .init(number: "5555", meaning: "A major life shift is unfolding for your highest good."),
        .init(number: "7777", meaning: "Deep spiritual growth. Trust your intuition."),
        .init(number: "8888", meaning: "Financial and emotional abundance are on the horizon."),
        .init(number: "1010", meaning: "Stay grounded and optimistic about what comes next."),
        .init(number: "1313", meaning: "Embrace transformation. You are growing in a new direction."),
        .init(number: "818", meaning: "Prosperity is cycling back to you. Stay open to receive."),
    ]

    /// Returns a random number, avoiding an immediate repeat of `previous`.
    static func random(excluding previous: AngelNumber? = nil) -> AngelNumber {
        let pool = all.filter { $0 != previous }
        return pool.randomElement() ?? all[0]
    }
}
