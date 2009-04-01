//
//  Emptylines.h
//  Emptylines
//
//  Created by mark on 3/25/09.
//  Copyright 2009 Six Apart, Ltd.. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol TMPlugInController
- (float)version;
@end

@interface OakDocumentController (Unspacer)
- (void) saveUnspacedDocument:(id)fp8;
@end

@interface Emptylines : NSObject
{
	NSMenu* fileMenu;
	NSMenuItem* oldSaver;
}
- (id)initWithPlugInController:(id <TMPlugInController>)aController;
- (void)installSaver;
- (void)saveDocument:(id)fp8;
@end