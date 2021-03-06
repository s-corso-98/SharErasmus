var codFiscaleUser; //cod Fiscale dell'utente bloccato
var sessionUser = localStorage.getItem("email");   //utente loggato


$(document).ready(function () {
  var arr = [];//List users
  var block = [];//List Block users

  returnUserBlock();

  //utente fittizio (notifiche)
  $(document).on('click', '#notify', function () {

    var chatBox = "notifiche";
    var username = "Notifiche";

    if ($.inArray(chatBox, arr) != -1) {
      arr.splice($.inArray(chatBox, arr), 1);
    }

    arr.unshift(chatBox);
    chatPopup = '<div class="msg_box" style="right:240px" rel="' + chatBox + '">' +
      '<div class="msg_head">' + username +
      '<div class="buttonsChat">' +
      '<button type="button" id="notifyChat"><i class="fas fa-bell"></i></button>' +
      '<div class="closeChat">x</div></div> </div>' +
      '<div class="msg_wrap"><div class="msg_body"><div class="msg_push"></div></div>' +
      '<div class="msg_footer"><textarea style="resize:none; visibility:hidden" class="msg_input" ></textarea>' +
      '</div></div></div>';
    $("body").append(chatPopup);
    displayChatBox();
  });

  //cercaUtente submit
  $("#input-group").on("submit", function (e) {
    e.preventDefault();
    cercaUtente();
  })

  $(document).on('click', '.msg_head', function () {
    var chatbox = $(this).parents().attr("rel");
    $('[rel="' + chatbox + '"] .msg_wrap').slideToggle('slow');
    return false;
  });

  //closeChat
  $(document).on('click', '.closeChat', function () {
    var chatbox = $(this).parents().parents().parents().attr("rel");
    $('[rel="' + chatbox + '"]').remove();
    arr.splice($.inArray(chatbox, arr), 1);
    displayChat();
    return false;
  });


  //Impostazioni chat singola

  $(document).on('click', '#settingsChatSingle', function () {
    var optionsPopup = $(this).parent().parent().children(":first");
    if (optionsPopup.css('display') == 'none') {
      optionsPopup.css("display", "block");
    }
    else {
      optionsPopup.css("display", "none");
    }

    // displayChatBox();
    return false;
  });

  function displayChat() {
    i = 270; // start position
    j = 260;  //next position

    $.each(arr, function (index, value) {
      if (index < 4) {
        $('[rel="' + value + '"]').css("right", i);
        $('[rel="' + value + '"]').show();
        i = i + j;
      }
      else {
        $('[rel="' + value + '"]').hide();
      }
    });
  }

  //Select user
  $(document).on('click', '.user', function () {

    var userID = $(this).attr("id");
    var username = $(this).children().text();
    if ($.inArray(userID, arr) != -1) {
      arr.splice($.inArray(userID, arr), 1);
    }

    arr.unshift(userID);

    var openChats = $(".msg_box").attr("rel");
    if (openChats != userID) {
      if (block.includes(userID)) {
        chatPopup = '<div class="msg_box" style="right:240px" rel="' + userID + '">' +
          '<div class="msg_head " id="' + userID + '">' +
          '<div id="optionsSettingChat"> ' +
          '</div>' + username +
          '<div class="buttonsChat" id="' + userID + '">' +
          '<button id="' + userID + '" class="unlockUser"><i class="fas fa-unlock" aria-hidden="true"></i></button>' +
          '<div class="closeChat">x</div></div> </div>' +
          '<div class="msg_wrap"><div class="msg_body" id ="' + userID + '"><div class="msg_push"></div></div>' +
          '<div class="msg_footer" ><textarea style="resize:none" class="msg_input" id ="' + userID + '"></textarea>' +
          '<button id="inviaMsg" rel="' + userID + '"><i class="fa fa-send" aria-hidden="true"></i></button></div> </div></div>';

        $("body").append(chatPopup);
        $('div[id="' + userID + '"]' + ".msg_head").css("background", "red");

        $(".msg_input").prop("disabled", true);
      }
      else {
        chatPopup = '<div class="msg_box" style="right:240px" rel="' + userID + '">' +
          '<div class="msg_head" id="' + userID + '">' +
          '<div id="optionsSettingChat"> ' +
          '</div>' + username +
          '<div class="buttonsChat" id="' + userID + '">' +
          '<button id="' + userID + '" class="blockUser" ><i class="fas fa-ban" aria-hidden="true"></i></button>' +
          '<div class="closeChat">x</div></div> </div>' +
          '<div class="msg_wrap"><div class="msg_body" id ="' + userID + '"><div class="msg_push"></div></div>' +
          '<div class="msg_footer" ><textarea style="resize:none" class="msg_input" id ="' + userID + '"></textarea>' +
          '<button id="inviaMsg" rel="' + userID + '" ><i class="fa fa-send" aria-hidden="true"></i></button></div> </div></div>';
        $("body").append(chatPopup);

      }


      displayChatBox();
    }


  })


  //Observer in ascolto per nuovi messaggi
  $(document).ready(function () {
    
    var ref = firebase.database().ref('chat');
    var tag = firebase.database().ref('tagUtente');//tag dell'utente loggato
    var post = firebase.database().ref('tagPost');
    tag.on('child_added', function (snap) {
      $.get("/user/visualizzaDA?email=" + sessionUser, function (data) {
        var codFiscaleUser = data.codiceFiscale;
        if (snap.key == codFiscaleUser) {
          post.on('child_added', function (snapshot) {

            Object.keys(snap.val()).forEach(k1 => {
              Object.keys(snapshot.val()).forEach(k2 => {
                if (snap.val()[k1] === snapshot.val()[k2]) {
                  if ($('div[rel="notifiche" ]' + '.msg_box').length) {
                    msg = "E' stato inserito un nuovo post con :" + snap.val()[k1];
                    $('<div class="msg-right">' + msg + '</div>').insertBefore('[rel= "notifiche"] .msg_push');
                    $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
                  }
                  else {
                    //aproboxNotifiche
                    var chatBox = "notifiche";
                    var username = "Notifiche";
                    arr.unshift(chatBox);
                    chatPopup = '<div class="msg_box" style="right:240px" rel="' + chatBox + '">' +
                      '<div class="msg_head">' + username +
                      '<div class="buttonsChat">' +
                      '<button type="button" id="notifyChat"><i class="fas fa-bell"></i></button>' +
                      '<div class="closeChat">x</div></div> </div>' +
                      '<div class="msg_wrap"><div class="msg_body"><div class="msg_push"></div></div>' +
                      '<div class="msg_footer"><textarea style="resize:none; visibility:hidden" class="msg_input" ></textarea>' +
                      '</div></div></div>';
                    $("body").append(chatPopup);
                    displayChatBox();
                    //notifica
                    msg = "E' stato inserito un nuovo post con : " + snap.val()[k1];
                    $('<div class="msg-right">' + msg + '</div>').insertBefore('[rel= "notifiche"] .msg_push');
                    $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
                   
                  }
                }
              })
            })
          })
        }
      })

    })

    ref.on('child_added', function (snapshot) {
      var newChild = snapshot.val();
      if (block.indexOf(newChild.mittente) >= 0) {    //if utente bloccato, elimina messaggio
        snapshot.ref().remove();
      } else {
        //chat aperta
        if ($('div[rel="' + newChild.mittente + '"]' + '.msg_box').length) {  //se la chat aperta, mostra nuovo messaggio
          showNewMsg(newChild);
          firebase.database().ref('chat/' + snapshot.key).update({ letto: true });

        }
        else {
          //apri boxnotifiche
          var chatBox = "notifiche";
          var username = "Notifiche";
          if (newChild.mittente != sessionUser && snapshot.val().letto == false) {
            if ($.inArray(chatBox, arr) != -1) {
              arr.splice($.inArray(chatBox, arr), 1);
            }

            arr.unshift(chatBox);
            chatPopup = '<div class="msg_box" style="right:240px" rel="' + chatBox + '">' +
              '<div class="msg_head">' + username +
              '<div class="buttonsChat">' +
              '<button type="button" id="notifyChat"><i class="fas fa-bell"></i></button>' +
              '<div class="closeChat">x</div></div> </div>' +
              '<div class="msg_wrap"><div class="msg_body"><div class="msg_push"></div></div>' +
              '<div class="msg_footer"><textarea style="resize:none; visibility:hidden" class="msg_input" ></textarea>' +
              '</div></div></div>';
            $("body").append(chatPopup);
            displayChatBox();
            //notifica
            $.get("/user/visualizzaDA?email=" + newChild.mittente, function (data) {
              user = data.nome + " " + data.cognome;
              msg = "Nuovo messaggio da:<br/>" + user;
              $('<div class="msg-right">' + msg + '</div>').insertBefore('[rel= "notifiche"] .msg_push');
              $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);

            })
          }
        }
      }
    })
  })

  //Display chat singola
  function displayChatBox() {
    i = 270; // start position
    j = 260;  //next position
    var app = new Array();
    var check = true;

    $.each(arr, function (index, value) {
      var chatbox = $(".msg_input").parents().parents().parents().attr("rel");
      if (index < 4) {

        $('[rel="' + value + '"]').css("right", i);
        var ref = firebase.database().ref('chat');
        ref.on("child_added", function (snapshot) {
          if (app.filter(function (e) { return e.chiave == snapshot.key; }).length < 1) {
            app.push({
              chiave: snapshot.key,
              valori: snapshot.val()
            })
            //sort array per data e ora
            app.sort(function (a, b) {
              var dataeoraA = new Date(Number(a.valori.date.split('-')[2]), Number(a.valori.date.split('-')[1]), Number(a.valori.date.split('-')[0]), Number(a.valori.ora.split(':')[0]), Number(a.valori.ora.split(':')[1]), Number(a.valori.ora.split(':')[2]));
              var dataeoraB = new Date(Number(b.valori.date.split('-')[2]), Number(b.valori.date.split('-')[1]), Number(b.valori.date.split('-')[0]), Number(b.valori.ora.split(':')[0]), Number(b.valori.ora.split(':')[1]), Number(b.valori.ora.split(':')[2]));
              return dataeoraA < dataeoraB ? -1 : dataeoraA > dataeoraB ? 1 : 0;
            });

          }

        })

        app.forEach(snapshot => {
          if (check) {
            loadMsg(snapshot, chatbox);
          }
        })
        check = false;
        $('[rel="' + value + '"]').show();
        i = i + j;

      }
      else {
        $('[rel="' + value + '"]').hide();
      }
    });
  }

  //aggiunta di nuovi messaggi alle chat
  function showNewMsg(newChild) {
    var destinatario = newChild.destinatario;
    var mittente = newChild.mittente;
    var msg = newChild.msg;
    if (destinatario == sessionUser) {
      $('<div class="msg-left">' + msg + '</div>').insertBefore('[rel="' + mittente + '"] .msg_push');
      $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
    }
  }

  //caricamento messaggi nelle singole chat
  function loadMsg(app, chatbox) {
    if (app.valori.destinatario == chatbox && app.valori.mittente == sessionUser) {
      $('<div class="msg-right">' + app.valori.msg + '</div>').insertBefore('[rel="' + chatbox + '"] .msg_push');
      $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
    } else if (app.valori.destinatario == sessionUser && app.valori.mittente == chatbox) {
      $('<div class="msg-left">' + app.valori.msg + '</div>').insertBefore('[rel="' + chatbox + '"] .msg_push');
      $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
      firebase.database().ref('chat/' + app.chiave).update({ letto: true });
    }
  }

  // sending message and store with Firebase
  function send(msg, user) {
    var msg = msg;
    $(".msg_input").val('');
    if (msg.trim().length != 0) {
      var chatbox = user;
      $('<div class="msg-right">' + msg + '</div>').insertBefore('[rel="' + chatbox + '"] .msg_push');
      $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);

      //Firebase
      let today = new Date();
      let day = today.getDate() + "-" + today.getMonth() + 1 + "-" + today.getYear();
      let hour = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
      let db = firebase.database();
      db.ref("chat").push().set({
        mittente: sessionUser,
        destinatario: chatbox,
        date: day,
        ora: hour,
        msg: msg,
        letto: false
      })
    }
  }
  //Return user bloccati
  function returnUserBlock() {
    $.get("/user/visualizzaDA?email=" + sessionUser, function (data) {
      codFiscaleUser = data.codiceFiscale;

      let db = firebase.database();
      db.ref("BlockUsers/" + codFiscaleUser).on("child_added", function (snapshot) {
        if (block.indexOf(snapshot.val()) < 0) {
          block.push(snapshot.val());
        }
      })
    })

  }



  //Blocca Utente
  function blockUser(user) {
    var check = true;
    var user = user;     //email utente loggato
    var snap;
    let db = firebase.database();
    $.get("/user/visualizzaDA?email=" + sessionUser, function (data) {
      codFiscaleUser = data.codiceFiscale;
      db.ref("BlockUsers/" + codFiscaleUser).on("child_added", function (snapshot) {
        snap = snapshot;
        if (snapshot.val() == user) {
          check = false;
        }
      })
      if (check) {    //se check è false, l'utente è gia bloccato
        db.ref("BlockUsers/" + codFiscaleUser).push(user);
        if (block.indexOf(snap.val()) < 0) {
          block.push(snap.val());
        }
      }
      $('div[id="' + user + '"]' + ".msg_head").css("background", "red"); //background rosso
      $('div[id="' + user + '"]' + ".buttonsChat").html( '<button id="' + user + '" class="unlockUser"><i class="fas fa-unlock" aria-hidden="true"></i></button><div class="closeChat">x</div>' ); //cambio bottone
      $('textarea[id="' + user + '"]' + ".msg_input").prop("disabled", true); //blocca texarea
    })


  }
  //sblocca utente
  function unlockUser(user) {
    var user = user;     //email utente loggato
    $.get("/user/visualizzaDA?email=" + sessionUser, function (data) {
      codFiscaleUser = data.codiceFiscale;

      let db = firebase.database();
      db.ref("BlockUsers/" + codFiscaleUser).on("child_added", function (snapshot) {
        if (snapshot.val() == user) {
          db.ref("BlockUsers/" + codFiscaleUser + "/" + snapshot.key).remove();
          block.splice(block.indexOf(snapshot.val()), 1);
        }
      })

      $('div[id="' + user + '"]' + ".msg_head").css("background", "#3273D4");
      $('div[id="' + user + '"]' + ".buttonsChat").html('<button id="' + user + '" class="blockUser" ><i class="fas fa-ban" aria-hidden="true"></i></button><div class="closeChat">x</div>'); 
      $('textarea[id="' + user + '"]' + ".msg_input").prop("disabled", false);
    })

  }

  //invio msg con click su bottone
  $(document).on('click', '#inviaMsg', function () {
    var text = $(this).parents().children(":first").val();
    send(text, $(this).attr("rel"));

  })
  //invio msg con tastiera
  $(document).on('keypress', 'textarea', function (e) {
    if (e.keyCode == 13) {
      send($(this).val(), $(this).attr('id'));
      if(e.preventDefault){
        e.preventDefault();
        return false;
      }
    }
  });
  //evento blocca utente
  $(document).on('click', '.blockUser', function (e) {
    blockUser($(this).attr("id"));

  })
  //evento sblocca utente
  $(document).on('click', '.unlockUser', function (e) {
    unlockUser($(this).attr("id"));

  })



});

//Cerca Utente
function cercaUtente() {
  document.getElementById("chatForm").style.display = "block";
  $(document).ready(function () {
    var user = $("input[name = trovaUser]").val();

    if (user == null) {
      openForm();
    }
    else {


      $.get("/chat/cercaUtente?trovaUser=" + user, function (data) {
        $("#listaContatti").empty();


        let i, j;
        let sizeUser = data[0].length;
        let sizecoord = data[1].length;
        //Aggiungo studenti

        for (i = 0; i < sizeUser; i++) {
          if (sessionUser != data[0][i].emailStudente) {
            var user = data[0][i].nome + " " + data[0][i].cognome;
            var id = data[0][i].emailStudente;
            var img = data[0][i].imgProfiloPath;
            var help;
            let image = new Image();
            image.src = 'data:image/png;base64,' + img;

            if (img == null || img == undefined) {
              help = './img/noUserimg.png';
            }
            else {
              help = image.src;
            }


            $("#listaContatti").append("<li class=\"user\" id=" + id + ">" +
              "<div class=\"contact\">" +
              "<div class=\"img_cont\">" +
              "<img src= " + help + "> </div>" +
              "<div class=\"user_info\"><p>" + user + "</p>" +
              "</div></div>" +
              "</li>")
          }

        }
        //Aggiungo coordinatori

        for (j = 0; j < sizecoord; j++) {
          if (sessionUser != data[1][j].emailCoordinatore) {
            var user = data[1][j].nome + " " + data[1][j].cognome;
            var id = data[1][j].emailCoordinatore;
            var img = data[1][j].imgProfiloPath;
            let image = new Image();
            image.src = 'data:image/png;base64,' + img
  
            var help2;
            if (img == null || img == undefined) {
              help2 = './img/noUserimg.png';
            }
            else {
              help2 = image.src;
            }




            $("#listaContatti").append("<li class=\"user\" id=" + id + ">" +
              "<div class=\"contact\">" +
              "<div class=\"img_cont\">" +
              "<img src=" + help2 + "> </div>" +
              "<div class=\"user_info\"><p>" + user + "</p>" +
              "<i class= \"fa fa-check \" ></i>" +
              "</div></div>" +
              "</li>")
          }
        }

      })
    }
  })
}

//List users in chat
function openForm() {
  document.getElementById("chatForm").style.display = "block";
  $(document).ready(function () {
    $("#listaContatti").empty();
    $.get("/chat/chatlist", function (data) {
      let i, j;
      let sizeUser = data[0].length;
      let sizecoord = data[1].length;
      //Aggiungo studenti
      for (i = 0; i < sizeUser; i++) {
        if (sessionUser != data[0][i].emailStudente) {
          var user = data[0][i].nome + " " + data[0][i].cognome;
          var id = data[0][i].emailStudente;
          var img = data[0][i].imgProfiloPath;

          let image = new Image();
          image.src = 'data:image/png;base64,' + img;

          var help;
          if (img == null || img == undefined) {
            help = './img/noUserimg.png';
          }
          else {
            help = image.src;
          }
          $("#listaContatti").append("<li class=\"user\" id=" + id + ">" +
            "<div class=\"contact\">" +
            "<div class=\"img_cont\">" +
            "<img src= " + help + "> </div>" +
            "<div class=\"user_info\"><p>" + user + "</p>" +
            "</div></div>" +
            "</li>")
        }
      }
      //Aggiungo coordinatori
      for (j = 0; j < sizecoord; j++) {
        if (sessionUser != data[1][j].emailCoordinatore) {
          var user = data[1][j].nome + " " + data[1][j].cognome;
          var id = data[1][j].emailCoordinatore;
          var img = data[1][j].imgProfiloPath;

          let image = new Image();
          image.src = 'data:image/png;base64,' + img

          var help2;
          if (img == null || img == undefined) {
            help2 = './img/noUserimg.png';
          }
          else {
            help2 = image.src;
          }
          $("#listaContatti").append("<li class=\"user\" id=" + id + ">" +
            "<div class=\"contact\">" +
            "<div class=\"img_cont\">" +
            "<img src=" + help2 + "> </div>" +
            "<div class=\"user_info\"><p>" + user + "</p>" +
            "<i class= \"fa fa-check \" ></i>" +
            "</div></div>" +
            "</li>")
        }
      }
    })

  })
}

function closeForm() {
  document.getElementById("chatForm").style.display = "none";


}



