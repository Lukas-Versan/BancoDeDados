drop database if exists escola;
create database escola;
use escola;
show databases;

create table alunos(
	id int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) not null,
    data_nascimento date,
    turma_id int
);

create table professores(
	id int auto_increment primary key,
    nome varchar(100) not null,
    especialidade varchar(100)
);

create table turmas(
	id int auto_increment primary key,
    nome varchar(100),
    professor_id int,
    horario time, 
    foreign key (professor_id) references professores(id)
);

create table disciplinas (
	id int auto_increment primary key,
    nome varchar(100) not null,
    carga_horaria int
);

create table notas (
	id int auto_increment primary key,
    aluno_id int,
    disciplina_id int,
    nota decimal(2, 1), 
    bimestre int,
    foreign key (aluno_id) references alunos(id),
    foreign key (disciplina_id) references disciplinas(id)    
);

alter table alunos add foreign key (turma_id) references turmas(id);

INSERT INTO professores (nome, especialidade) VALUES
('Ana Ribeiro', 'Matemática'),
('Carlos Mendes', 'História'),
('Beatriz Souza', 'Biologia'),
('João Farias', 'Física'),
('Mariana Duarte', 'Geografia'),
('Ricardo Almeida', 'Química'),
('Fernanda Lopes', 'Língua Portuguesa'), 
('Gustavo Pacheco', 'Educação Física'),
('Patrícia Nunes', 'Artes'),
('Leonardo Teixeira', 'Informática');

INSERT INTO turmas (nome, professor_id, horario) VALUES
('1º Ano A', 1, '08:00:00'),
('1º Ano B', 2, '09:00:00'),
('2º Ano A', 3, '10:00:00'),
('2º Ano B', 4, '11:00:00'),
('3º Ano A', 5, '13:00:00'),
('3º Ano B', 6, '14:00:00'),
('4º Ano A', 7, '15:00:00'),
('4º Ano B', 8, '16:00:00'),
('5º Ano A', 9, '17:00:00'),
('5º Ano B', 10, '18:00:00');

drop table notas, alunos;

INSERT INTO alunos (nome, email, data_nascimento, turma_id) VALUES
('Lucas Andrade', 'lucas.andrade@email.com', '2010-03-12', 1),
('Marina Costa', 'marina.costa@email.com', '2010-07-25', 1),
('Pedro Henrique', 'pedro.henrique@email.com', '2011-01-09', 2),
('Julia Ribeiro', 'julia.ribeiro@email.com', '2011-10-03', 2),
('Rafael Martins', 'rafael.martins@email.com', '2012-05-18', 3),
('Carolina Silva', 'carolina.silva@email.com', '2012-11-28', 3),
('Bruno Oliveira', 'bruno.oliveira@email.com', '2010-06-14', 4),
('Larissa Gomes', 'larissa.gomes@email.com', '2010-12-22', 4),
('Thiago Pires', 'thiago.pires@email.com', '2009-08-30', 5),
('Amanda Ferreira', 'amanda.ferreira@email.com', '2009-02-17', 5),
('Gabriel Santos', 'gabriel.santos@email.com', '2011-04-05', 6),
('Yasmin Duarte', 'yasmin.duarte@email.com', '2011-09-19', 6),
('Diego Farias', 'diego.farias@email.com', '2012-02-08', 7),
('Sofia Almeida', 'sofia.almeida@email.com', '2012-07-27', 7),
('Henrique Lopes', 'henrique.lopes@email.com', '2010-03-03', 8),
('Paula Nunes', 'paula.nunes@email.com', '2010-08-21', 8),
('Matheus Rocha', 'matheus.rocha@email.com', '2009-05-11', 9),
('Beatriz Monteiro', 'beatriz.monteiro@email.com', '2009-09-29', 9),
('Eduardo Teixeira', 'eduardo.teixeira@email.com', '2011-01-20', 10),
('Isabela Cardoso', 'isabela.cardoso@email.com', '2011-06-16', 10);