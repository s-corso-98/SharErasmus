let express = require('express');
let cookieParser = require('cookie-parser');
let logger = require('morgan');
let path = require('path');
let upload = require('express-fileupload');
let chatRoute= require('./routes/chatCNT');




let forumRoute = require('./routes/forumCNT');
let userRouter = require('./routes/userCNT');
let userRouter2 = require('./routes/upl');
let userRouter3 = require('./routes/rcpPassword');
let userRouter4 = require('./routes/tag');
let coordRoute = require('./routes/coordinatoriCNT');


let app = express();
let credeFirebase = require('./routes/credeFb.json');
let firebase = require('firebase');

// Initialize Firebase
let config = {
    apiKey: credeFirebase.apiKey,
    authDomain: credeFirebase.authDomain,
    databaseURL: credeFirebase.databaseURL,
    projectId: credeFirebase.projectId,
    storageBucket: credeFirebase.storageBucket,
    messagingSenderId: credeFirebase.messagingSenderId
};

firebase.initializeApp(config);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'docs')));
app.use(cookieParser());

app.use('/chat', chatRoute);
app.use('/forum', forumRoute);
app.use('/user', userRouter);
app.use('/user2', userRouter2);
app.use('/user3', userRouter3);
app.use('/user4', userRouter4);
app.use(upload());
app.use('/coordinatore', coordRoute);

let server = app.listen(3000, "127.0.0.1", function () {
    let address = server.address().address;
    let port = server.address().port;
    console.log("Listening on " + address + ":" + port);
});

module.exports = app;
