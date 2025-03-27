import redis

print('# connecting to Redis server, assuming your redis installed on your localhost')

r = redis.Redis(host='localhost', port=6379, db=0)

print('# printing the keys')
for key in r.scan_iter():
    print(key)
print('# all keys printed')
