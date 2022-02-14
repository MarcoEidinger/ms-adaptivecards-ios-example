//
//  AdaptiveCardViewController.swift
//  MSAdaptiveCardExample
//
//  Created by Eidinger, Marco on 8/16/21.
//

import Foundation
import UIKit
import SafariServices

class AdaptiveCardViewController: UIViewController, ACRActionDelegate{

    internal var cardJson: String = "{ \"$schema\": \"http://adaptivecards.io/schemas/adaptive-card.json\", \"type\": \"AdaptiveCard\", \"version\": \"1.0\", \"body\": [ { \"type\": \"Container\", \"items\": [ { \"type\": \"TextBlock\", \"text\": \"Publish Adaptive Card schema\", \"weight\": \"bolder\", \"size\": \"medium\" }, { \"type\": \"ColumnSet\", \"columns\": [ { \"type\": \"Column\", \"width\": \"auto\", \"items\": [ { \"type\": \"Image\", \"url\": \"https://pbs.twimg.com/profile_images/3647943215/d7f12830b3c17a5a9e4afcc370e3a37e_400x400.jpeg\", \"size\": \"small\", \"style\": \"person\" } ] }, { \"type\": \"Column\", \"width\": \"stretch\", \"items\": [ { \"type\": \"TextBlock\", \"text\": \"Matt Hidinger\", \"weight\": \"bolder\", \"wrap\": true }, { \"type\": \"TextBlock\", \"spacing\": \"none\", \"text\": \"Created {{DATE(2017-02-14T06:08:39Z, SHORT)}}\", \"isSubtle\": true, \"wrap\": true } ] } ] } ] }, { \"type\": \"Container\", \"items\": [ { \"type\": \"TextBlock\", \"text\": \"Now that we have defined the main rules and features of the format, we need to produce a schema and publish it to GitHub. The schema will be the starting point of our reference documentation.\", \"wrap\": true }, { \"type\": \"FactSet\", \"facts\": [ { \"title\": \"Board:\", \"value\": \"Adaptive Card\" }, { \"title\": \"List:\", \"value\": \"Backlog\" }, { \"title\": \"Assigned to:\", \"value\": \"Matt Hidinger\" }, { \"title\": \"Due date:\", \"value\": \"Not set\" } ] } ] } ], \"actions\": [ { \"type\": \"Action.ShowCard\", \"title\": \"Comment\", \"card\": { \"type\": \"AdaptiveCard\", \"body\": [ { \"type\": \"Input.Text\", \"id\": \"comment\", \"isMultiline\": true, \"placeholder\": \"Enter your comment\" } ], \"actions\": [ { \"type\": \"Action.Submit\", \"title\": \"OK\" } ] } }, { \"type\": \"Action.OpenUrl\", \"title\": \"View\", \"url\": \"https://adaptivecards.io\" } ] }"

    override func viewDidLoad() {
        super.viewDidLoad()
        let cardParseResult = ACOAdaptiveCard.fromJson(cardJson);
        if((cardParseResult?.isValid)!){
            let renderResult = ACRRenderer.render(cardParseResult!.card, config: nil, widthConstraint: 335);

            if(renderResult?.succeeded ?? false)
            {
                let ad = renderResult?.view;
                ad!.acrActionDelegate = (self as ACRActionDelegate);
                self.view.autoresizingMask = [.flexibleHeight];
                ad!.translatesAutoresizingMaskIntoConstraints = false;

                // hack to ensure that images get rendered
                ad!.waitForAsyncTasksToFinish()
                for acrSubView in ad!.subviews[0].subviews {
                    acrSubView.removeFromSuperview()
                }
                _ = ad!.render() as? ACRView

                self.view.addSubview(ad!);

                NSLayoutConstraint(item: ad!, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true;
                NSLayoutConstraint(item: ad!, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 3).isActive = true;
            }
        }
    }

    func didFetchUserResponses(_ card: ACOAdaptiveCard, action: ACOBaseActionElement)
    {
        if(action.type == ACRActionType.openUrl){
            let url = URL.init(string:action.url());
            let svc = SFSafariViewController.init(url: url!);
            self.present(svc, animated: true, completion: nil);
        } else if action.type == ACRActionType.submit {
            guard let userInputsAsJson = card.inputs() else { return }
            guard let userInput = String(data: userInputsAsJson, encoding: .utf8) else { return }
            let alert = UIAlertController(title: action.title(), message: "User Input: \(userInput) and Data: \(String(describing: action.data()))", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
