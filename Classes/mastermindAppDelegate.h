//
//  mastermindAppDelegate.h
//  mastermind
//
//  Created by JULIETTE RIVIERE on 12/03/15.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class mastermindViewController;

@interface mastermindAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    mastermindViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet mastermindViewController *viewController;

@end

