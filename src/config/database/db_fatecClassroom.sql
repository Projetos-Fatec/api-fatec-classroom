create database db_fatecClassroom;

use db_fatecClassroom;

create table tb_admin(
	idAdmin int auto_increment not null,
	adminName varchar(50) not null,
    cpf varchar(11) not null,
    passwd varchar(255) not null,
    email varchar(120) not null,
    phone varchar(11) not null,
    dateRegister timestamp default current_timestamp,
	dateAccess date not null,
    profileImage text,
    primary key(idAdmin)
);

create table tb_classroom(
	idClassroom int auto_increment not null,
	descriptive varchar(20) not null,
    classroomType enum('lab', 'sala'),
    primary key(idClassroom)
);

create table tb_course(
	idCourse int auto_increment not null,
	descriptive varchar(20) not null,
	primary key(idCourse)
);

create table tb_professor(
	idProfessor int auto_increment not null,
    professorName varchar(50) not null,
	passwd varchar(255) not null,
    email varchar(120) not null,
    phone varchar(11) not null,
    profileImage text,
    primary key(idProfessor)
);

create table tb_professorCourse(
	idProfessorCourse int auto_increment not null,
	idProfessor int not null,
    idCourse int not null,
    dateRegister timestamp default current_timestamp,
    primary key(idProfessorCourse),
    foreign key(idProfessor) references tb_professor(idProfessor),
    foreign key(idCourse) references tb_course(idCourse)
);

create table tb_class(
	idClass int auto_increment not null,
    idProfessor int not null,
    idCourse int not null,
    idClassroom int not null,
    descriptive varchar(40) not null,
    classScheduleStart time not null,
    classScheduleEnd time not null,
    classDay date not null,
    primary key(idClass),
    foreign key(idProfessor) references tb_professor(idProfessor),
    foreign key(idCourse) references tb_course(idCourse),
    foreign key(idClassroom) references tb_classroom(idClassroom)
);

create table tb_model(
	idModel int auto_increment not null,
    descriptive varchar(40) not null,
    primary key(idModel)
);

create table tb_equipmentType(
	idType int auto_increment not null,
    descriptive varchar(30) not null,
    primary key(idType)
);

create table tb_equipment(
	idEquipment int auto_increment not null,
    idType int not null,
    idClassroom int not null,
    idModel int not null,
    descriptive varchar(50) not null,
    dateRegister timestamp default current_timestamp,
    primary key(idEquipment),
    foreign key(idType) references tb_equipmentType(idType),
    foreign key(idClassroom) references tb_classroom(idClassroom),
    foreign key(idModel) references tb_model(idModel)
);

create table tb_component(
	idComponent int auto_increment not null,
    idModel int not null,
    idType int not null,
    descriptive varchar(50) not null,
    dateRegister timestamp default current_timestamp,
    primary key(idComponent),
    foreign key(idModel) references tb_model(idModel),
    foreign key(idType) references tb_equipmentType(idType)
);

create table tb_equipmentComponent(
	idEquipmentComponent int auto_increment not null,
    idComponent int not null,
    idEquipment int not null,
    primary key(idEquipmentComponent),
    foreign key(idEquipment) references tb_equipment(idEquipment),
    foreign key(idComponent) references tb_component(idComponent)
);

create table tb_errorReport(
	idErrorReport int auto_increment not null,
    idProfessor int not null,
    title varchar(40) not null,
    descriptive text not null,
    reportStatus enum('aguardando', 'concluido') not null,
    dateRegister timestamp default current_timestamp,
    primary key(idErrorReport),
    foreign key(idProfessor) references tb_professor(idProfessor)
);

create table tb_equipmentReport(
	idEquipmentReport int auto_increment not null,
    idErrorReport int not null,
    idEquipment int not null,
    primary key(idEquipmentReport),
    foreign key(idErrorReport) references tb_errorReport(idErrorReport),
    foreign key(idEquipment) references tb_equipment(idEquipment)
);