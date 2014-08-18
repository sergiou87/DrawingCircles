//
//  SPShapeCircleLayer.m
//
//
//  Created by Sergio Padrino on 31/07/14.
//
//

#import "SPShapeCircleLayer.h"

@implementation SPShapeCircleLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
		self.lineCap = kCALineCapRound;
		self.lineJoin = kCALineJoinRound;
		self.fillColor = nil;
		self.anchorPoint = CGPointMake(0.5f, 0.5f);
    }
    return self;
}

- (void)setBounds:(CGRect)bounds
{
	[super setBounds:bounds];
	
    [self updateCircle];
}

- (void)setRadius:(CGFloat)radius
{
    _radius = radius;
    [self updateCircle];
}

- (void)setFlatness:(CGFloat)flatness
{
    _flatness = flatness;
    [self updateCircle];
}

- (void)updateCircle
{
    CGRect bounds = self.bounds;
	CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGFloat size = self.radius * 2.f;
    CGRect rect = CGRectMake(center.x - self.radius,
                             center.y - self.radius,
                             size,
                             size);
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    path.flatness = self.flatness;
    self.path = path.CGPath;
}

@end
