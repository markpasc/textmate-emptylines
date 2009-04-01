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

@interface OakDocument : NSObject
{
	NSString* filename;
}

-(NSString*) filename;
-(BOOL) checkForFilesystemChanges;
-(BOOL) setFileModificationDate:(id)fp1;
@end

@interface OakDocumentController : NSWindowController
{
	NSObject *textView;
	id statusBar;
	OakDocument *textDocument;
}
@end

@interface OakDocumentController (Unspacer)
- (void) saveUnspacedDocument:(id)fp8;
@end

@interface Emptylines : NSObject
{
}
- (id)initWithPlugInController:(id <TMPlugInController>)aController;
- (void)installSaver;
@end