# Example iOS app

Example app for iOS, including YieldloveAdIntegration and YieldloveExternalConfiguration, for displaying ads.

**Beware:** This example does not demonstrate the use of consent management.

## How to run

1. Install Xcode 13.0 or later (if not already installed)
2. Clone this repository anywhere on your computer
3. Open IntegrationExample.xcodeproj with Xcode
4. Run the app (it may take a few seconds before the ad is displayed)

## Try out your configuration

You may want to try out your specific configuration. This is done very simply:
change `appName` and `adSlotId` in method `ViewController.viewDidLoad` to specific values for your configuration.

### Dependencies

This project **already includes** dependencies needed to run it:

- YieldloveAdIntegration `9.6.0`
- YieldloveExternalConfiguration `0.20.0`
- PromiseKit `~>8`
