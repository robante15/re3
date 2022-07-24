#include "pthread_ctr.h"

/* haha probably the worst pthread "implementation" ever. */

#define S64_MAX 0x7fffffffffffffff

#define MAX_KEYS 32
static int pthread_key_index = 0;

typedef void*(*dconfn)(void*);

dconfn*         pthread_dcon[MAX_KEYS]; /* global */
__thread void** pthread_keys[MAX_KEYS]; /* thread-local */

void
sched_yield()
{
	usleep(1000); /* lmao, this should work? */
}

/* void */
/* threadWrapper(void (*fn)(void*), void *arg) */
/* { */
/* 	int i; */
/* 	void *rv = fn(); */

/* 	for(i = 0; i < MAX_KEYS; i++){ */
/* 		if (pthread_dcon[i]){ */
/* 			pthread_dcon(pthread_keys[i]); */
/* 		} */
/* 	} */
	
/* 	threadExit((int)fv); */
/* } */

int
pthread_create(pthread_t *thread, const pthread_attr_t *attr,
	       void *(*start_routine) (void *), void *arg)
{
	*thread	=
		threadCreate(start_routine,
			     arg,
			     1024*128,
			     0x30,
			     -1,
			     false);
	return 0;
}

int
pthread_join(pthread_t thread, void **retval)
{
	threadJoin(thread, U64_MAX);
	return 0;
}

int
pthread_mutexattr_init(pthread_mutexattr_t *attr)
{
	return 0;
}

int
pthread_mutexattr_settype(pthread_mutexattr_t *attr, int flags)
{
	return 0;
}

int
pthread_mutexattr_destroy(pthread_mutexattr_t *mutex)
{
	return 0;
}

int
pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t *attr)
{
	svcCreateMutex(mutex, false);
	return 0;
}

int
pthread_mutex_destroy(pthread_mutex_t *mutex)
{
	return 0;
}

int
pthread_mutex_lock(pthread_mutex_t *mutex)
{
	svcWaitSynchronization(mutex, S64_MAX);
	return 0;
}

int
pthread_mutex_unlock(pthread_mutex_t *mutex)
{
	svcReleaseMutex(mutex);
	return 0;
}

int
pthread_once(pthread_once_t *once, void (*callback)(void))
{
	if(!AtomicPostIncrement(&once->is_initialized)){
		callback();
		__dsb();
		once->init_executed = 1;
	}else {
		while (!once->init_executed){
			usleep(1000);
		}
	}
	return 0;
}

int
pthread_key_create(pthread_key_t *key, void (*destructor)(void*))
{
	*key = AtomicPostIncrement(&pthread_key_index);

	if(*key > MAX_KEYS){
		return 1; /* ENOMEM */
	}
	
	pthread_dcon[*key] = destructor;

	return 0;
}

int
pthread_key_delete(pthread_key_t key)
{
	return 0;
}

void*
pthread_getspecific(pthread_key_t key)
{
	return pthread_keys[key];
}

int
pthread_setspecific(pthread_key_t key, void *val)
{
	pthread_keys[key] = val;
	return 0;
}
