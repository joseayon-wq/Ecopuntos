function registrar(e) {
  e.preventDefault();
  var nombre = document.getElementById("nombre").value;
  var correo = document.getElementById("correo").value;
  var grupo = document.getElementById("grupo").value;
  var pass1 = document.getElementById("pass1").value;
  var pass2 = document.getElementById("pass2").value;

  if (correo.indexOf("@cbta197.net") === -1) {
    alert("Solo puedes usar tu correo del CBTA 197 (terminación @cbta197.net)");
    return;
  }
  if (pass1 !== pass2) {
    alert("Las contraseñas no son iguales");
    return;
  }

  var alumno = {
    nombre: nombre,
    correo: correo,
    grupo: grupo,
    password: pass1,
    puntos: 0,
    posicion: 1600
  };

  localStorage.setItem("alumno", JSON.stringify(alumno));
  alert("Registro exitoso, ahora inicia sesión");
  window.location.href = "login.html";
}

function login(e) {
  e.preventDefault();
  var correo = document.getElementById("correoLogin").value;
  var pass = document.getElementById("passLogin").value;
  var datos = localStorage.getItem("alumno");

  if (datos === null) {
    alert("No hay ningún alumno registrado");
    return;
  }

  var alumno = JSON.parse(datos);
  if (correo === alumno.correo && pass === alumno.password) {
    alert("Bienvenido " + alumno.nombre);
    window.location.href = "perfil.html";
  } else {
    alert("Correo o contraseña incorrectos");
  }
}

function protegerPagina() {
  var datos = localStorage.getItem("alumno");
  if (datos === null) {
    alert("Debes iniciar sesión para entrar aquí");
    window.location.href = "login.html";
  }
}

function mostrarPerfil() {
  var datos = localStorage.getItem("alumno");
  if (datos !== null) {
    var alumno = JSON.parse(datos);
    if(document.getElementById("nombrePerfil")) {
      document.getElementById("nombrePerfil").innerHTML = alumno.nombre;
      document.getElementById("grupoPerfil").innerHTML = "Grupo: " + alumno.grupo;
      document.getElementById("correoPerfil").innerHTML = alumno.correo;
      document.getElementById("puntosPerfil").innerHTML = alumno.puntos + " pts";
      document.getElementById("posicionPerfil").innerHTML = alumno.posicion + "°";
    }
  }
}

function controlarVistaRanking() {
  var datos = localStorage.getItem("alumno");
  var urlParams = new URLSearchParams(window.location.search);
  var vieneDelIndex = urlParams.get('desde') === 'inicio';

  var contenedorTabla = document.getElementById("contenedorRanking");
  var mensajeBloqueo = document.getElementById("mensajeBloqueo");
  var panelMiPosicion = document.getElementById("panelMiPosicion");

  if (datos === null && vieneDelIndex) {
    if(contenedorTabla) contenedorTabla.style.display = "none";
    if(panelMiPosicion) panelMiPosicion.style.display = "none";
    if(mensajeBloqueo) mensajeBloqueo.style.display = "block";
  } else {
    if(contenedorTabla) contenedorTabla.style.display = "block";
    if(mensajeBloqueo) mensajeBloqueo.style.display = "none";
    
    if (datos !== null && panelMiPosicion) {
      var alumno = JSON.parse(datos);
      panelMiPosicion.style.display = "block";
      document.getElementById("miPosicionNum").innerHTML = alumno.posicion + "°";
      document.getElementById("miNombre").innerHTML = alumno.nombre + " (" + alumno.grupo + ")";
      document.getElementById("miPuntos").innerHTML = alumno.puntos + " pts";
    }
  }
}

function cerrarSesion() {
  localStorage.removeItem("alumno");
  window.location.href = "index.html";
}