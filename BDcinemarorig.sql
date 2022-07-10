
create table formato_pelicula (
id_formato int primary key,
nombre_formato varchar (2),
precio_formato double);

create table pelicula (
id_pelicula int primary key, 
titulo_pelicula varchar (30),
duracion_pelicula time,
genero_pelicula varchar (10), 
resumen_pelicula varchar (30), 
horario_peli time,
dia_peli varchar (10), 
id_formato int,
foreign key (id_formato) references formato_pelicula (id_formato)
);
create table tipo_usuario(
id_tipo_usuario int primary key,
nombre_tipo varchar (10)
);
create table usuario (
id_usuario int primary key,
nombre_usuario varchar (15),
apellido_usuario varchar (15),
email_usuario  varchar (20),
contraseña_usuario varchar (10),
telefono_usuario int(10),
tiene_descuento double, 
id_tipo_usuario int,
foreign key (id_tipo_usuario) references tipo_usuario (id_tipo_usuario)
);
alter table usuario drop tiene_descuento;
alter table usuario add column tiene_tarjeta_usuario boolean;

create table descuento (
id_desc int primary key ,
dia_desc varchar (10),
porcentaje_desc int
);
create table reserva (
id_reserva int primary key,
fecha_reserva date, 
total_reserva double,
id_desc int, 
id_pelicula int,
id_usuario int,
foreign key (id_desc) references descuento (id_desc),
foreign key (id_pelicula) references pelicula (id_pelicula),
foreign key (id_usuario) references usuario (id_usuario)
);

create table sala(
id_sala int primary key,
nombre_sala varchar (8),
capacidad_sala int, 
id_pelicula int,
foreign key (id_pelicula) references pelicula (id_pelicula));

create table butaca (
id_butaca int primary key,
fila_butaca char, 
columna_butaca int,
id_sala int,
foreign key (id_sala) references sala (id_sala)
);

alter table usuario drop direccion_usuario;

use cinemar;
insert into tipo_usuario values (1, "cliente");
insert into tipo_usuario values (2, "admi");

insert into usuario values (1, "Pablo", "Sanchez", "pausan@gmail.com" ,"56345", 387569833, true,1 );
insert into usuario values (2, "Sabrina", "Lopez", "sabri@gmail.com" ,"sa256", 388633825, true,1);
insert into usuario values (3, "Angelica", "Montaño", "an55@gmail.com", "angelica1", 11635741, true,1);
insert into usuario values (4, "Maximiliano", "Nuñez", "maxi20@gmail.com", "max256", 386355442, false,2);
insert into usuario values (5, "Florencia", "Velazquez", "pato34@gmail.com", "34569", 387469537, true,1);

insert into formato_pelicula values (1, "2D",500);
insert into formato_pelicula values (2, "3D", 700);

insert into pelicula values (1, "Thor" , "01:50:00", "aventura", "Dios del trueno", "20:30", "viernes", 2);
insert into pelicula values (2, "Jurassic World" , "02:15:00", "aventura", "dinosaurios por todo el mundo", "17:00", "jueves", 1);
insert into pelicula values (3, "Lightyear", "02:30:00" , "fantasia", "aventura intergaláctica" , "19:00", "martes", 2);
insert into pelicula values (4, "Minions" ,"01:45:00", "infantil", "ayudantes de villano", "17:00", "domingo", 1);