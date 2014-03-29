//
//  PeticionesGETViewController.h
//  peticionesGET
//
//  Created by Ruben on 28/03/14.
//  Copyright (c) 2014 AppAndWeb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeticionesGETViewController : UIViewController<NSURLConnectionDelegate, NSURLConnectionDataDelegate>{
    
    NSURLRequest *request;
    NSURLConnection *connectionInProgress;
    NSMutableData *data;
}

@end
