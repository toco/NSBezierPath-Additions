//
//  NSBezierPath+Schneider_FitCurves.h
//
//  Uses the FitCurve-Algorithm by Philip J. Schneider
//  http://tog.acm.org/resources/GraphicsGems/gems/FitCurves.c
//
//  Created by Tobias Conradi on 29.04.11.
//  Copyright 2011 Tobias Conradi. All rights reserved.
//  https://github.com/toco/NSBezierPath-Additions
//  http://tobias-conradi.de/index.php/2011/05/06/nsbezierpath-additions

#import <Foundation/Foundation.h>

@interface NSBezierPath (NSBezierPath_Schneider_FitCurves)
/*
 performs the FitCurve function by Philip J. Schneider on the NSBezierPath
 does NOT work for NSBezierPaths containing NSCurvesToBezierPathElements
 
 double error: User-defined error squared
 returns 1 on errors
 returns 0 when returning without errors
 */
- (int) schneiderFitCurves:(double) error;

@end
