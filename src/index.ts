import { json, urlencoded } from 'express';
import { App, Cors } from './server'
import { TReqRes } from './types';

const PORT = process.env.PORT || 3003; 

App.use(urlencoded({extended: true}));
App.use(json());
App.use(Cors);

App.get('/', ({req, res}:TReqRes) => {
  res.send('OK');
})

App.listen(PORT);