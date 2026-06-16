import SwiftUI

public struct Palette: Sendable {
    public let appBg: Color
    public let boardBg: Color
    public let text: Color
    public let sub: Color
    public let pill: Color
    public let accent: Color
    public let accentText: Color
    public let tileCovered: Color
    public let tileCoveredHi: Color
    public let tileCoveredEdge: Color
    public let tileRevealed: Color
    public let tileRevealedEdge: Color
    public let mushroomCap: Color
    public let mushroomStem: Color
    public let mushroomSpot: Color
    public let explodeBg: Color
    public let markerPost: Color
    public let markerSign: Color
    public let markerInk: Color
    public let emptyMark: Color
    public let tierBorder: Color
    public let tierBg: Color
    public let tierSelBg: Color
    public let numberColors: [Color]

    public init(
        appBg: Color,
        boardBg: Color,
        text: Color,
        sub: Color,
        pill: Color,
        accent: Color,
        accentText: Color,
        tileCovered: Color,
        tileCoveredHi: Color,
        tileCoveredEdge: Color,
        tileRevealed: Color,
        tileRevealedEdge: Color,
        mushroomCap: Color,
        mushroomStem: Color,
        mushroomSpot: Color,
        explodeBg: Color,
        markerPost: Color,
        markerSign: Color,
        markerInk: Color,
        emptyMark: Color,
        tierBorder: Color,
        tierBg: Color,
        tierSelBg: Color,
        numberColors: [Color]
    ) {
        self.appBg = appBg
        self.boardBg = boardBg
        self.text = text
        self.sub = sub
        self.pill = pill
        self.accent = accent
        self.accentText = accentText
        self.tileCovered = tileCovered
        self.tileCoveredHi = tileCoveredHi
        self.tileCoveredEdge = tileCoveredEdge
        self.tileRevealed = tileRevealed
        self.tileRevealedEdge = tileRevealedEdge
        self.mushroomCap = mushroomCap
        self.mushroomStem = mushroomStem
        self.mushroomSpot = mushroomSpot
        self.explodeBg = explodeBg
        self.markerPost = markerPost
        self.markerSign = markerSign
        self.markerInk = markerInk
        self.emptyMark = emptyMark
        self.tierBorder = tierBorder
        self.tierBg = tierBg
        self.tierSelBg = tierSelBg
        self.numberColors = numberColors
    }
}

extension Palette {
    public static let forest = Palette(
        appBg:           Color(hex: 0xF3EFE4),
        boardBg:         Color(hex: 0xECE6D6),
        text:            Color(hex: 0x3A3D30),
        sub:             Color(hex: 0x8C8C74),
        pill:            Color(hex: 0xEAE4D4),
        accent:          Color(hex: 0x6E8B4E),
        accentText:      Color(hex: 0xFBF9F1),
        tileCovered:     Color(hex: 0xAEBE8F),
        tileCoveredHi:   Color(hex: 0xC0CEA1),
        tileCoveredEdge: Color(hex: 0x93A675),
        tileRevealed:    Color(hex: 0xFBF9F1),
        tileRevealedEdge:Color(hex: 0xE8E2D0),
        mushroomCap:     Color(hex: 0xC5603F),
        mushroomStem:    Color(hex: 0xD6A458),
        mushroomSpot:    Color(hex: 0xEBCBA2),
        explodeBg:       Color(hex: 0xE3B3A1),
        markerPost:      Color(hex: 0x7A5B45),
        markerSign:      Color(hex: 0xC5603F),
        markerInk:       Color(hex: 0xFBF3E8),
        emptyMark:       Color(hex: 0xA4B187),
        tierBorder:      Color(hex: 0xE1DBC9),
        tierBg:          Color(hex: 0xFBF9F1),
        tierSelBg:       Color(hex: 0xEFF2E2),
        numberColors: [
            .clear,
            Color(hex: 0x5C8C57),
            Color(hex: 0x3E7C8C),
            Color(hex: 0xC5603F),
            Color(hex: 0x7A5BA6),
            Color(hex: 0xB8893B),
            Color(hex: 0x3E8C7C),
            Color(hex: 0x7A5B45),
            Color(hex: 0x6B6B6B)
        ]
    )

    public static let twilight = Palette(
        appBg:           Color(hex: 0x161B22),
        boardBg:         Color(hex: 0x10151B),
        text:            Color(hex: 0xE7EAEE),
        sub:             Color(hex: 0x7E8893),
        pill:            Color(hex: 0x222A34),
        accent:          Color(hex: 0x6FBFA8),
        accentText:      Color(hex: 0x0E1318),
        tileCovered:     Color(hex: 0x29313B),
        tileCoveredHi:   Color(hex: 0x333D48),
        tileCoveredEdge: Color(hex: 0x1E252E),
        tileRevealed:    Color(hex: 0x1B212A),
        tileRevealedEdge:Color(hex: 0x262E38),
        mushroomCap:     Color(hex: 0xE0B25A),
        mushroomStem:    Color(hex: 0xF2E8CE),
        mushroomSpot:    Color(hex: 0xC58A3C),
        explodeBg:       Color(hex: 0x7C3B33),
        markerPost:      Color(hex: 0x6B5640),
        markerSign:      Color(hex: 0xE0B25A),
        markerInk:       Color(hex: 0x1B212A),
        emptyMark:       Color(hex: 0x39434F),
        tierBorder:      Color(hex: 0x2B3440),
        tierBg:          Color(hex: 0x1E2630),
        tierSelBg:       Color(hex: 0x22302E),
        numberColors: [
            .clear,
            Color(hex: 0x7FB0E0),
            Color(hex: 0x83C9A0),
            Color(hex: 0xE59B7E),
            Color(hex: 0xB79AE0),
            Color(hex: 0xE0C57E),
            Color(hex: 0x79C9C9),
            Color(hex: 0xC9A78F),
            Color(hex: 0xAEB4BC)
        ]
    )

    public static func palette(for appearance: Appearance) -> Palette {
        switch appearance {
        case .forest:   return .forest
        case .twilight: return .twilight
        }
    }
}

extension Color {
    public init(hex: UInt32) {
        let r = Double((hex >> 16) & 0xFF) / 255.0
        let g = Double((hex >> 8) & 0xFF) / 255.0
        let b = Double(hex & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
