//
//  SPDrawCircleLayer.m
//
//
//  Created by Sergio Padrino on 31/07/14.
//
//

#import "SPDrawCircleLayer.h"

@implementation SPDrawCircleLayer

@dynamic flatness;
@dynamic radius;
@dynamic lineWidth;
@dynamic strokeColor;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentsScale = [[UIScreen mainScreen] scale];
    }
    return self;
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    // Disable implicit animations when stroke changes
    if ([key isEqualToString: @"contents"])
        return nil;
    
    return [super actionForKey: key];
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    NSArray *keys = @[ @"flatness", @"radius", @"lineWidth", @"strokeColor" ];
    
    if ([keys containsObject:key])
    {
        return YES;
    }
    else
    {
        return [super needsDisplayForKey:key];
    }
}

- (void)drawInContext:(CGContextRef)ctx
{
	UIGraphicsPushContext(ctx);

	UIBezierPath *path = [self pathForArcInRect:self.bounds];
    path.lineJoinStyle = kCGLineJoinRound;
	path.lineCapStyle = kCGLineCapRound;
	path.lineWidth = self.lineWidth;
    path.flatness = self.flatness;

	CGContextSetStrokeColorWithColor(ctx, self.strokeColor);
	CGContextSetLineWidth(ctx, self.lineWidth);
	[path stroke];

	UIGraphicsPopContext();
}

- (UIBezierPath *)pathForArcInRect:(CGRect)rect
{
	CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
	
	UIBezierPath *path = [UIBezierPath bezierPath];
	[path addArcWithCenter:center
					radius:self.radius
				startAngle:0.f
				  endAngle:M_PI * 2.f
				 clockwise:YES];
	
	return path;
}

@end
