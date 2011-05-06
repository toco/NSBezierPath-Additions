//
//  NSBezierPath+DouglasPeucker.h
//
//  Created by Tobias Conradi on 28.04.11.
//  Copyright 2011 Tobias Conradi. All rights reserved.
//  https://github.com/toco/NSBezierPath-Additions
//  
//  port from C# implentation:
//  http://www.codeproject.com/KB/cs/Douglas-Peucker_Algorithm.aspx
//  http://tobias-conradi.de/index.php/2011/05/06/nsbezierpath-additions

#import <Foundation/Foundation.h>
#import "TCLog.h"

@interface NSBezierPath (NSBezierPath_DouglasPeucker)

//Only works for paths build without NSCurveToBezierPathElements
- (NSBezierPath *) pathFromDouglasPeuckerReduction:(double)tolerance;
@end
