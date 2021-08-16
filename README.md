# ms-adaptivecards-ios-example
Example of rendering an Adaptive Card (Microsoft) on iOS

Based on https://github.com/Microsoft/AdaptiveCards/tree/main/source/ios#example-code-in-swift-bridging-header

Input

```json
{
  "type": "AdaptiveCard",
  "version": "1.0",
  "body": [
    {
      "type": "Image",
      "url": "http://adaptivecards.io/content/adaptive-card-50.png",
      "horizontalAlignment": "center"
    },
    {
      "type": "TextBlock",
      "horizontalAlignment": "center",
      "text": "Hello **Adaptive Cards!**"
    }
  ],
  "actions": [
    {
      "type": "Action.OpenUrl",
      "title": "Learn more",
      "url": "http://adaptivecards.io"
    },
    {
      "type": "Action.OpenUrl",
      "title": "GitHub",
      "url": "http://github.com/Microsoft/AdaptiveCards"
    }
  ]
}
```

Output

![Example Output](.resources/SimulatorScreenShotiPhone11Example.png)