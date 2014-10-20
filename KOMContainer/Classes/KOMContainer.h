//
//  KOMContainer.h
//  KOMContainer
//
//  Created by KohkiMakimoto on 10/17/14.
//
//

#import <Foundation/Foundation.h>

@interface KOMContainer : NSObject

/**
 *  Get a shared container instance.
 *
 *  @return a container instance
 */
+ (KOMContainer *)sharedContainer;

/**
 *  Register a binding with the container.
 *
 *  @param key
 *  @param shared
 *  @param resolver
 */
- (void)bindKey:(NSString *)key shared:(BOOL)shared resolver:(id (^)(KOMContainer *container))resolver;

/**
 *  Register a shared binding with the container.
 *
 *  @param key
 *  @param resolver
 */
- (void)bindKey:(NSString *)key resolver:(id (^)(KOMContainer *container))resolver;

/**
 *  Register a shared object with the container.
 *
 *  @param key
 *  @param object
 */
- (void)bindKey:(NSString *)key object:(id)object;

/**
 * Resolve the key and get a object from the container.
 *
 *  @param key
 *
 *  @return a resoloved object.
 */
- (id)objectForKey:(NSString *)key;

@end
