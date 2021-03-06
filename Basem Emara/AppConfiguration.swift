//
//  AppConfiguration.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-10-21.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import SwiftyPress

class AppConfiguration: DependencyFactory {
    
    override func resolveStore() -> ConstantsStore {
        // Declare environment mode
        let environment: Environment = {
            #if DEBUG
            return .development
            #elseif STAGING
            return .staging
            #else
            return .production
            #endif
        }()
        
        return ConstantsMemoryStore(
            environment: environment,
            itunesName: "basememara",
            itunesID: "1021806851",
            baseURL: {
                switch environment {
                case .development:
                    return URL(string: "https://staging2.basememara.com")!
                case .staging:
                    return URL(string: "https://staging3.basememara.com")!
                case .production:
                    return URL(string: "https://basememara.com")!
                }
            }(),
            baseREST: "wp-json/swiftypress/v3",
            wpREST: "wp-json/wp/v2",
            email: "contact@basememara.com",
            privacyURL: "https://basememara.com/privacy/?mobileembed=1",
            disclaimerURL: "https://basememara.com/disclaimer/?mobileembed=1",
            styleSheet: "https://basememara.com/wp-content/themes/metro-pro/style.css",
            googleAnalyticsID: "UA-60131988-2",
            featuredCategoryID: 64,
            logFileName: "basememara",
            logDNAKey: nil
        )
    }
    
    override func resolveStore() -> PreferencesStore {
        let constants: ConstantsType = resolve()
        
        return PreferencesDefaultsStore(
            defaults: {
                UserDefaults(
                    suiteName: {
                        switch constants.environment {
                        case .development, .staging: return "group.io.zamzam.Basem-Emara-staging"
                        case .production: return "group.io.zamzam.Basem-Emara"
                        }
                    }()
                ) ?? .standard
            }()
        )
    }
    
    override func resolveStore() -> SeedStore {
        return SeedFileStore(
            forResource: "seed.json",
            inBundle: .main
        )
    }
    
    override func resolve() -> Theme {
        let preferences: PreferencesType = resolve()
        
        return ThemePreset(rawValue: preferences.get(.currentTheme) ?? "")?.type
            ?? ThemePreset.default.type
    }
}
