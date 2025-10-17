-- Creacion de la base de datos diseñada para la gestion de una aplicacion de cines

CREATE DATABASE gestion_cines;
USE gestion_cines;

CREATE TABLE cine(
nombre_cine VARCHAR(100) NOT NULL,
costo_global double NOT NULL,
anuncios_activos boolean NOT NULL,
CONSTRAINT pk_nombre_cine PRIMARY KEY (nombre_cine)
);

CREATE TABLE pelicula(
poster_url VARCHAR(255) NOT NULL,
titulo_pelicula VARCHAR(200) NOT NULL,
sinopsis VARCHAR(500) NOT NULL,
cast VARCHAR(300) NOT NULL,
fecha_estreno DATE NOT NULL,
director VARCHAR(30) NOT NULL,
duracion VARCHAR(9) NOT NULL,
clasificacion ENUM('A','B12','B15','C'),
categoria ENUM('ACCION','COMEDIA','TERROR','ROMANCE','ANIMACION'),
CONSTRAINT pk_titulo_pelicula PRIMARY KEY (titulo_pelicula) 
); 

CREATE TABLE anuncio_bloqueado(
costo double NOT NULL,
es_bloqueado boolean NOT NULL,
periodo_tiempo INT NOT NULL,
nombre_cine VARCHAR(100) NOT NULL,
CONSTRAINT fk_nombre_cine_sin_anuncio FOREIGN KEY (nombre_cine) REFERENCES cine(nombre_cine)
);

CREATE TABLE usuario(
nombre_usuario VARCHAR(100) NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
contrasenna VARCHAR(30) NOT NULL,
cartera_digital DOUBLE NOT NULL,
tipo_usuario ENUM('ADMIN_CINE','ADMIN_SISTEMA','COMUN','ESPECIAL') NOT NULL,
CONSTRAINT pk_correo_usuario PRIMARY KEY (correo_usuario)
);

CREATE TABLE anuncio(
id_anuncio INT AUTO_INCREMENT,
tipo_anuncio ENUM('TEXTO','TEXTO_IMAGEN','VIDEO_TEXTO') NOT NULL,
costo_anuncio DOUBLE NOT NULL,
costo_dia DOUBLE NOT NULL,
texto VARCHAR(500),
imagen_url VARCHAR(255),
video_url VARCHAR(255),
CONSTRAINT pk_id_anuncio PRIMARY KEY (id_anuncio)
);

CREATE TABLE anuncio_comprado(
id_anuncio_comprado INT AUTO_INCREMENT,
costo DOUBLE NOT NULL,
es_activo BOOLEAN NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
periodo ENUM('1','3','7','14') NOT NULL,	
id_anuncio INT NOT NULL,
CONSTRAINT fk_id_anuncio FOREIGN KEY (id_anuncio) REFERENCES anuncio(id_anuncio),
CONSTRAINT pk_id_comprado PRIMARY KEY (id_anuncio_comprado),
CONSTRAINT fk_correo_usuario_especial FOREIGN KEY (correo_usuario) REFERENCES usuario(correo_usuario)
);

CREATE TABLE sala(
nombre_sala VARCHAR(15) NOT NULL,
costo_sala DOUBLE NOT NULL,
cupo_sala INT NOT NULL,
titulo_pelicula VARCHAR(200),
nombre_cine VARCHAR(100) NOT NULL,
CONSTRAINT pk_id_sala PRIMARY KEY (nombre_sala,nombre_cine),
CONSTRAINT fk_cine_sala FOREIGN KEY(nombre_cine) REFERENCES cine(nombre_cine)
);

CREATE TABLE funcion(
nombre_cine VARCHAR(100) NOT NULL,
nombre_sala VARCHAR(15) NOT NULL,
fecha DATE,
hora_inicio TIME,
hora_fin TIME,
titulo_pelicula VARCHAR(200),
CONSTRAINT pk_funcion PRIMARY KEY (nombre_cine, nombre_sala, fecha, hora_inicio),
CONSTRAINT fk_sala_funcion FOREIGN KEY(nombre_sala,nombre_cine) REFERENCES sala(nombre_sala,nombre_cine),
CONSTRAINT fk_pelicula_funcion FOREIGN KEY(titulo_pelicula) REFERENCES pelicula(titulo_pelicula)
);

CREATE TABLE comentario_pelicula(
comentario_pelicula VARCHAR(300) NOT NULL,
titulo_pelicula VARCHAR(200) NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
CONSTRAINT fk_pelicula_comentario FOREIGN KEY(titulo_pelicula) REFERENCES pelicula(titulo_pelicula),
CONSTRAINT fk_usuario_pelicula_comentario FOREIGN KEY(correo_usuario) REFERENCES usuario(correo_usuario)
);

CREATE TABLE calificacion_pelicula(
numero_estrellas_pelicula DOUBLE NOT NULL,
titulo_pelicula VARCHAR(200) NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
CONSTRAINT fk_pelicula_calificacion FOREIGN KEY(titulo_pelicula) REFERENCES pelicula(titulo_pelicula),
CONSTRAINT fk_usuario_pelicula_calificacion FOREIGN KEY(correo_usuario) REFERENCES usuario(correo_usuario)
);

CREATE TABLE comentario_sala(
nombre_cine VARCHAR(100) NOT NULL,
comentario_sala VARCHAR(300) NOT NULL,
nombre_sala VARCHAR(15) NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
CONSTRAINT fk_sala_comentario FOREIGN KEY(nombre_sala,nombre_cine) REFERENCES sala(nombre_sala,nombre_cine),
CONSTRAINT fk_usuario_sala_comentario FOREIGN KEY(correo_usuario) REFERENCES usuario(correo_usuario)
);

CREATE TABLE calificacion_sala(
numero_estrellas_sala DOUBLE NOT NULL,
nombre_cine VARCHAR(100) NOT NULL,
nombre_sala VARCHAR(15) NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
CONSTRAINT fk_sala_calificacion FOREIGN KEY(nombre_sala,nombre_cine) REFERENCES sala(nombre_sala,nombre_cine),
CONSTRAINT fk_usuario_sala_calificacion FOREIGN KEY(correo_usuario) REFERENCES usuario(correo_usuario)
);

CREATE TABLE boleto(
nombre_cine VARCHAR(100) NOT NULL,
cantidad_boletos INT NOT NULL,
costo_boleto DOUBLE NOT NULL,
titulo_pelicula VARCHAR(200) NOT NULL,
correo_usuario VARCHAR(100) NOT NULL,
nombre_sala VARCHAR(15) NOT NULL,
fecha DATE NOT NULL,
hora_inicio TIME NOT NULL,
CONSTRAINT fk_pelicula_boleto FOREIGN KEY(titulo_pelicula) REFERENCES pelicula(titulo_pelicula),
CONSTRAINT fk_usuario_boleto FOREIGN KEY(correo_usuario) REFERENCES usuario(correo_usuario),
CONSTRAINT fk_sala_boleto FOREIGN KEY(nombre_sala,nombre_cine) REFERENCES sala(nombre_sala,nombre_cine),
 CONSTRAINT fk_funcion_boleto FOREIGN KEY (nombre_cine, nombre_sala, fecha, hora_inicio)
        REFERENCES funcion(nombre_cine, nombre_sala, fecha, hora_inicio)
);
