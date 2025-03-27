const redis = require('redis');
  
async function redisClient(){
  console.log('initiating redis client');
  const client = redis.createClient(
  {
    socket: {
      host: '127.0.0.1',
      port: 6379
  }
  });
  client.on('error', (err) => console.error);
  console.log('trying to connect');
  await client.connect();
  console.log('connected');
  const keys = await client.sendCommand(["keys","*"]);
  if(!keys || keys.length == 0){
    console.log('No Keys in Redis');
  } else {
    console.log('printing all keys:')
    console.log(keys);
  }
  await client.disconnect();
}
redisClient();