//
//  ViewController.h
//  CoverFlow Demo
//
//  Created by Swapnil Godambe on 11/03/13.
//  Copyright (c) 2013  Swap(). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFOpenFlowView.h"
 

@interface ViewController : UIViewController<AFOpenFlowViewDataSource, AFOpenFlowViewDelegate>
{
    // For CoverFlow
    NSArray *coverImageData;
    NSDictionary *interestingPhotosDictionary;
    NSOperationQueue *loadImagesOperationQueue;

}



@property (retain, nonatomic) IBOutlet AFOpenFlowView *coverflow;

@property (strong, nonatomic) IBOutlet UIView *viewCoverflow;
 

@end
