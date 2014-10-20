//
//  KOMContainer.m
//  KOMContainer
//
//  Created by KohkiMakimoto on 10/17/14.
//
//

#import "KOMContainer.h"

static KOMContainer *sharedContainer = nil;

@interface KOMContainer ()

@property (nonatomic, strong) NSMutableDictionary *bindings;
@property (nonatomic, strong) NSMutableDictionary *instances;

@end


@implementation KOMContainer

+ (KOMContainer *)sharedContainer {
    @synchronized(self) {
        if (!sharedContainer) {
            sharedContainer = [[self alloc] init];
        }
    }
    return sharedContainer;
}

- (instancetype)init {
    self = [super init];
    
    self.bindings = [NSMutableDictionary dictionary];
    self.instances = [NSMutableDictionary dictionary];
    
    return self;
}

- (void)bindKey:(NSString *)key shared:(BOOL)shared resolver:(id (^)(KOMContainer *))resolver {
    NSDictionary *binding = @{@"resolver": resolver, @"shared": [NSNumber numberWithBool:shared]};
    
    [self.instances removeObjectForKey:key];
    
    [self.bindings setObject:binding forKey:key];
}

- (void)bindKey:(NSString *)key resolver:(id (^)(KOMContainer *))resolver {
    [self bindKey:key shared:YES resolver:resolver];
}

- (void)bindKey:(NSString *)key object:(id)object {
    [self.instances setObject:object forKey:key];
}

- (id)objectForKey:(NSString *)key {

    id instance = [self.instances objectForKey:key];
    if (instance != nil) {
        return instance;
    }
    
    NSDictionary *binding = (NSDictionary *)[self.bindings objectForKey:key];
    if (binding == nil) {
        return nil;
    }
    
    instance = ((id (^)(KOMContainer *))[binding objectForKey:@"resolver"])(self);

    if ([self isShared:key]) {
        [self.instances setObject:instance forKey:key];
    }

    return instance;
}

- (BOOL)isShared:(NSString *)key {
    BOOL shared = [self.instances objectForKey:key] != nil ? YES : NO;
    if (!shared) {
        NSDictionary *binding = (NSDictionary *)[self.bindings objectForKey:key];
        shared = [[binding objectForKey:@"shared"] boolValue];
    }
    
    return shared;
}

@end
