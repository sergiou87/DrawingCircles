//
//  SPViewController.m
//  DrawingCircles
//
//  Created by Sergio Padrino on 01/08/14.
//  Copyright (c) 2014 Sergio Padrino. All rights reserved.
//

#import "SPViewController.h"

#import "SPShapeCircleLayer.h"
#import "SPDrawCircleLayer.h"

@interface SPViewController ()

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic, weak) IBOutlet UIView *shapeCircleView;
@property (nonatomic, weak) IBOutlet UIView *drawCircleView;

@property (nonatomic, weak) IBOutlet UISlider *flatnessSlider;

@property (nonatomic) SPDrawCircleLayer *drawCircleLayer;
@property (nonatomic) SPShapeCircleLayer *shapeCircleLayer;

@end

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect circleViewBounds = self.shapeCircleView.bounds;
    CGPoint circleViewCenter = CGPointMake(CGRectGetMidX(circleViewBounds),
                                           CGRectGetMidY(circleViewBounds));

    self.drawCircleLayer = [SPDrawCircleLayer layer];
    self.drawCircleLayer.bounds = circleViewBounds;
    self.drawCircleLayer.lineWidth = 1.f;
    self.drawCircleLayer.strokeColor = UIColor.blackColor.CGColor;
    self.drawCircleLayer.position = circleViewCenter;
    [self.drawCircleView.layer addSublayer:self.drawCircleLayer];

    self.shapeCircleLayer = [SPShapeCircleLayer layer];
    self.shapeCircleLayer.bounds = circleViewBounds;
    self.shapeCircleLayer.lineWidth = 1.f;
    self.shapeCircleLayer.strokeColor = UIColor.blackColor.CGColor;
    self.shapeCircleLayer.position = circleViewCenter;
    [self.shapeCircleView.layer addSublayer:self.shapeCircleLayer];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.drawCircleLayer.radius =
    self.shapeCircleLayer.radius = self.shapeCircleView.frame.size.width / 2.f * 0.9f;

    [self updateLayerValues];
}

- (IBAction)sliderChanged:(id)sender
{
    [self updateLayerValues];
}

- (void)updateLayerValues
{
    self.drawCircleLayer.flatness =
    self.shapeCircleLayer.flatness = self.flatnessSlider.value;
}

@end
