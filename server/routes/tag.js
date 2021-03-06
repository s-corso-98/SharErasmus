let express = require('express');
let router = express.Router();
let studente = require('../model/Studente');
let coordinatore = require('../model/Coordinatore');
let firebase = require('firebase');


let regex = {
    nome: /\w+/g,
    //eslint-disable-next-line no-useless-escape
    email: /[a-zA-Z0-9\._-]+[@][a-zA-Z0-9\._-]+[.][a-zA-Z]{2,6}/g,
    password: /[A-Z0-9a-z.!@_-]{8,16}/g,
    facolta: /(\w+|\W+){0,30}/g,
    via: /(\w+(\W+)?)+/g,
    recapito: /\+?(\d+){0,12}/g,
    matricola: /(\d+){10}/g,
    //ruolo: /(\w+(\W+)?)+/g,
    codiceFiscale: /^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$/g
};


/**
 * Pre:  Utente autenticato.
 * Post: Verranno caricati i tag che l'utete inserisce.
 * Desc: Permette ad un utente di caricare nel db i tag che lui inserisce .
 */
router.post('/caricaTag', function (req, res) {
    let obj = req.body;
    if (obj.email.includes('@studenti.unisa.it')) {
        //studente

        if (obj.email.match(regex.email)) {
            //carico i tag studente
            studente.findOne({ where: { "emailStudente": obj.email } })
                .then(doc => {
                    if (doc === null) {
                        res.statusCode = 403;
                        res.send({ msg: "studente non trovato" }).end();
                    } else {
                        console.log('il codice fiscale è: ' + doc.codiceFiscale);
                        //setTimeout(() => {
                        let tags = [];
                        obj.tag.split(",").forEach(e => {
                            if (e != '') {
                                tags.push(e);
                                console.log(e);
                            }
                        });

                        //if (tags.length <= 5) {
                        firebase.database().ref('tagUtente/' + doc.codiceFiscale).remove();
                        tags.forEach(element => {
                            if (element != '') {
                                firebase.database().ref('tagUtente/' + doc.codiceFiscale).push("#" + element.toLowerCase().trim().split(" ").join(''));
                            }
                        });
                        res.send(doc).status(200).end();
                        /*}  else {
                            //restituisco errore
                            i = 0;
                            firebase.database().ref('tagUtente/' + doc.codiceFiscale).on('child_added',valore =>{
                                i+=1;
                            })
                            res.send({ msg: "Sforato il numero massimo di tag!, ne puoi inserire: "+(5-i)}).status(402).end();
                        }*/
                        //  }, 1000);


                        //res.send(doc).status(200).end();
                    }
                });
        } else {
            //errore nel formato
            res.send = 401;
            res.send({ msg: "Errore nel formato, regex non rispettata" }).end();
        }
    } else {
        //coordinatore
        if (obj.email.match(regex.email)) {
            //carico i tag coordinatori
            coordinatore.findOne({ where: { "emailCoordinatore": obj.email } })
                .then(doc => {
                    if (doc === null) {
                        res.statusCode = 403;
                        res.send({ msg: "coordinatore non trovato" }).end();
                    } else {
                        console.log('il codice fiscale è: ' + doc.codiceFiscale);
                        
                        //setTimeout(() => {
                        let tags = [];
                        obj.tag.split(",").forEach(e => {
                            if (e != '') {
                                tags.push(e);
                            }
                        });

                        firebase.database().ref('tagUtente/' + doc.codiceFiscale).remove();
                        
                        tags.forEach(element => {
                            if (element != '') {
                                
                                firebase.database().ref('tagUtente/' + doc.codiceFiscale).push("#" + element.toLowerCase().trim().split(" ").join(''));
                                
                            }
                        });
                        res.send(doc).status(200).end();
                    }
                });
        } else {
            //errore nel formato
            res.send = 401;
            res.send({ msg: "Errore nel formato, regex non rispettata" }).end();
        }
    }
});

router.get('/visualizzaTag', function (req, res) {
    let obj = req.query;
    if (obj.email.includes('@studenti.unisa.it')) {
        //studente
        if (obj.email.match(regex.email)) {
            //carico i tag studente
            studente.findOne({ where: { "emailStudente": obj.email } })
                .then(doc => {
                    if (doc === null) {
                        res.statusCode = 403;
                        res.send({ msg: "studente non trovato" }).end();
                    } else {
                        console.log('il codice fiscale è: ' + doc.codiceFiscale);
                        //visualizza
                        new Promise((resolve) => {
                            let rtn = '';
                            firebase.database().ref('tagUtente/' + doc.codiceFiscale).on('child_added', snapshot => {
                                rtn += snapshot.val() + ' ';
                                //res.send(rtn).status(200).end();
                                console.log('dfewfewfwe: ' + rtn);
                            });
                            setTimeout(() => {
                                resolve(rtn);
                            }, 100);
                            //console.log("Sono rtn: "+rtn);
                        }).then(val => {
                            res.send(val).status(200).end();
                        });
                    }
                });
            //console.log('Tag ricevuti: '+obj.tag);
        } else {
            //errore nel formato
            res.status = 401;
            res.send({ msg: "Errore nel formato, regex non rispettata" }).end();
        }
    } else {
        //coordinatore
        if (obj.email.match(regex.email)) {
            coordinatore.findOne({ where: { "emailCoordinatore": obj.email } })
                .then(doc => {
                    if (doc === null) {
                        res.statusCode = 403;
                        res.send({ msg: "coordinatore non trovato" }).end();
                    } else {
                        console.log('il codice fiscale è: ' + doc.codiceFiscale);
                        //visualizza
                        new Promise((resolve) => {
                            let rtn = '';
                            firebase.database().ref('tagUtente/' + doc.codiceFiscale).on('child_added', snapshot => {
                                rtn += snapshot.val() + ' ';
                                //res.send(rtn).status(200).end();
                                console.log('dfewfewfwe: ' + rtn);
                            });
                            setTimeout(() => {
                                resolve(rtn);
                            }, 100);
                            //console.log("Sono rtn: "+rtn);
                        }).then(val => {
                            res.send(val).status(200).end();
                        });
                    }
                });
            //console.log('Tag ricevuti: '+obj.tag);
        } else {
            //errore nel formato
            res.status = 401;
            res.send({ msg: "Errore nel formato, regex non rispettata" }).end();
        }
    }
});

module.exports = router;