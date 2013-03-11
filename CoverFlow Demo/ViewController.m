//
//  ViewController.m
//  CoverFlow Demo
//
//  Created by Swapnil Godambe on 11/03/13.
//  Copyright (c) 2013  Swap(). All rights reserved.
//

#import "ViewController.h"
#import "AFGetImageOperation.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSInteger curSelIssue;
}

@synthesize coverflow = _coverflow;
@synthesize viewCoverflow = _viewCoverflow;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    curSelIssue = 0;
   
    [_coverflow removeFromSuperview];
    _coverflow=[[AFOpenFlowView alloc] initWithFrame:CGRectMake(0, 0, _viewCoverflow.frame.size.width, _viewCoverflow.frame.size.height)];
    [_coverflow setDataSource:self];
    [_coverflow setViewDelegate:self];
    
    for (int i=0; i < 30; i++) {
            
        
        [(AFOpenFlowView *) self.coverflow setImage:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"%d.jpg", i]] forIndex:i];
        
        
    }
    
    [(AFOpenFlowView *)self.coverflow setNumberOfImages:30];
    
    [_coverflow setSelectedCover:curSelIssue];
    
    [_coverflow centerOnSelectedCover:YES];
    
    [self openFlowView:(AFOpenFlowView *)self.coverflow  selectionDidChange:curSelIssue];
    
    [_viewCoverflow addSubview:_coverflow];
    
}

#pragma mark - Coverflow datasource

- (void)openFlowView:(AFOpenFlowView *)openFlowView requestImageForIndex:(int)index
{
    AFGetImageOperation *getImageOperation = [[AFGetImageOperation alloc] initWithIndex:index viewController:self];
	
	
	[loadImagesOperationQueue addOperation:getImageOperation];
}

- (UIImage *)defaultImage
{
    return [UIImage imageNamed:@"loading.png"];
}

#pragma mark - Coverflow delegate

- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index
{
    curSelIssue = index;
    
    NSLog(@"Coverflow selection changed to Index %d", index);
}


@end
