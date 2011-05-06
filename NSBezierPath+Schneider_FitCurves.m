//
//  NSBezierPath+Schneider_FitCurves.m
//
//  Uses the FitCurve-Algorithm by Philip J. Schneider
//  http://tog.acm.org/resources/GraphicsGems/gems/FitCurves.c
//
//  Created by Tobias Conradi on 29.04.11.
//  Copyright 2011 Tobias Conradi. All rights reserved.
//  https://github.com/toco/NSBezierPath-Additions
//  http://tobias-conradi.de/index.php/2011/05/06/nsbezierpath-additions

#import "NSBezierPath+Schneider_FitCurves.h"
#import "GraphicsGems.h"

@implementation NSBezierPath (NSBezierPath_Schneider_FitCurves)
/*
 performs the FitCurve function by Philip J. Schneider on the NSBezierPath
 does NOT work for NSBezierPaths containing NSCurvesToBezierPathElements
 */
- (int) schneiderFitCurves:(double) error {
    // number of elements
    int count = [self elementCount];
    // allocating C-style array of CGPoints building the path
    CGPoint *pathPointArray = malloc(sizeof(CGPoint)*count);
    // allocating C-style array of CGPoints to get the points of the single elements
    CGPoint *aPointArray = malloc(sizeof(CGPoint)*3);
    //iterating through the path
    for (int i=0;i<count;i++) {
        //get elementType and associated point for the element 
        NSBezierPathElement type = [self elementAtIndex:i associatedPoints:aPointArray];
        //if a element is a NSCurveToBezierPathElement the algorythm does not work
        //returning without doing any changes to the Path
        if (type==NSCurveToBezierPathElement) {
            NSLog(@"Schneinder_FitCurves: Error: Path contains CurveElement");
            free(aPointArray);
            free(pathPointArray);
            return 1;
        }
        //adding point of current element to the pointArray
        pathPointArray[i] = aPointArray[0];
    }
    // free the temp pointArray
    free(aPointArray);
    //remove all points the curveelements will be added to this curve
    [self removeAllPoints];
    
    // move Path to the startPoint
    [self moveToPoint:pathPointArray[0]];
    
    /*
     Start Algorythm
     */
    FitCurve(pathPointArray, count, 4.0,self);

    
    
    //free pointArray
    free(pathPointArray);
    //no error return 0
    return 0;
}

@end
