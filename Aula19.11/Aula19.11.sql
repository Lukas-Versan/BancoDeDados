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

INSERT INTO disciplina (nome, carga_horaria) VALUES
('Matemática Básica', 60),
('Programação I', 80),
('Estruturas de Dados', 70),
('Banco de Dados', 60),
('Redes de Computadores', 50),
('Sistemas Operacionais', 60),
('Engenharia de Software', 40),
('Algoritmos Avançados', 70),
('Inteligência Artificial', 60),
('Computação Gráfica', 50);

INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre) VALUES
(1, 2, 8.5, 1),
(2, 3, 7.0, 1),
(3, 1, 9.0, 1),
(1, 4, 6.5, 2),
(2, 5, 8.0, 2),
(3, 7, 7.5, 2),
(4, 6, 9.5, 1),
(4, 8, 8.2, 2),
(5, 10, 7.8, 1),
(6, 9, 8.9, 2);
 --
select * from alunos where turma_id=1;
--
select * from alunos order by nome asc;
--
select nome, data_nascimento from alunos where data_nascimento > '2010-12-31';
--
 /*----------------------4--------------------------*/
 SELECT turmas.nome AS turma, COUNT(alunos.id) AS total_alunos
FROM turmas 
LEFT JOIN alunos ON alunos.turma_id = turmas.id
GROUP BY turmas.id, turmas.nome;

/*----------------------5--------------------------*/
SELECT disciplinas.nome AS disciplina,
       AVG(notas.nota) AS media_notas
FROM disciplinas
JOIN notas ON notas.disciplina_id = disciplinas.id
GROUP BY disciplinas.id, disciplinas.nome
ORDER BY disciplinas.nome;

/*----------------------6--------------------------*/
SELECT
    A.nome AS Aluno,
    T.nome AS Turma,
    P.nome AS Professor_Regente
FROM
    alunos A
INNER JOIN
    turmas T ON A.turma_id = T.id -- Conecta Aluno à Turma
INNER JOIN
    professores P ON T.professor_id = P.id -- Conecta Turma ao Professor
ORDER BY
    Aluno;

/*----------------------7--------------------------*/
SELECT
    A.nome AS Nome_Aluno,
    T.nome AS Turma,
    D.nome AS Disciplina,
    N.nota AS Nota,
    N.bimestre AS Bimestre
FROM
    alunos A
INNER JOIN
    notas N ON A.id = N.aluno_id       -- 1. Conecta o aluno com suas notas
INNER JOIN
    disciplinas D ON N.disciplina_id = D.id -- 2. Conecta a nota à disciplina
INNER JOIN
    turmas T ON A.turma_id = T.id      -- 3. Conecta o aluno à sua turma
ORDER BY
    Nome_Aluno, Disciplina, Bimestre;

/*----------------------8--------------------------*/
DELIMITER //

CREATE PROCEDURE CalcularMediaGeral (
    IN p_aluno_id INT,
    OUT p_media_geral DECIMAL(4, 2)
)
BEGIN
    -- Calcula a média aritmética de todas as notas do aluno
    SELECT
        AVG(nota)
    INTO
        p_media_geral
    FROM
        notas
    WHERE
        aluno_id = p_aluno_id;
END //

DELIMITER ;
SET @media_geral_do_aluno = 0.0;
CALL CalcularMediaGeral(2, @media_geral_do_aluno);
SELECT 'Média Geral do Aluno 2:' AS Teste, @media_geral_do_aluno AS Media_Geral_Calculada;
    
/*----------------------9--------------------------*/
 DELIMITER //

CREATE PROCEDURE ListarAlunosPorTurma (
    IN p_turma_id INT -- Parâmetro de entrada: o ID da turma desejada
)
BEGIN
    -- Seleciona os detalhes dos alunos, da turma e do professor
    SELECT
        A.nome AS Nome_do_Aluno,
        A.email AS Email_do_Aluno,
        T.nome AS Nome_da_Turma,
        P.nome AS Professor_Regente
    FROM
        alunos A
    INNER JOIN
        turmas T ON A.turma_id = T.id -- Conecta Alunos à Turma
    INNER JOIN
        professores P ON T.professor_id = P.id -- Conecta a Turma ao Professor
    WHERE
        A.turma_id = p_turma_id -- Filtra apenas os alunos da turma especificada
    ORDER BY
        A.nome;
END //

DELIMITER ;

CALL ListarAlunosPorTurma(1);
/*----------------------10--------------------------*/

SELECT
    A.nome AS Nome_do_Aluno,
    D.nome AS Nome_da_Disciplina,
    -- Calcula a média final das notas na disciplina
    AVG(N.nota) AS Media_Final,
    -- Usa a função CASE para determinar o status
    CASE
        WHEN AVG(N.nota) >= 7.0 THEN 'APROVADO'
        ELSE 'REPROVADO'
    END AS Status_Final
FROM
    alunos A
INNER JOIN
    notas N ON A.id = N.aluno_id
INNER JOIN
    disciplinas D ON N.disciplina_id = D.id
GROUP BY
    A.id, D.id, A.nome, D.nome
ORDER BY
    Nome_do_Aluno, Nome_da_Disciplina;

/*----------------------11--------------------------*/

SELECT
    A.nome AS Nome_do_Aluno,
    -- Calcula a média geral de todas as notas do aluno (em todas as disciplinas e bimestres)
    AVG(N.nota) AS Media_Geral,
    -- Usa uma função de janela (Window Function) para ranquear os alunos
    -- RANK() salta posições em caso de empate (ex: 1º, 2º, 2º, 4º)
    -- DENSE_RANK() não salta posições em caso de empate (ex: 1º, 2º, 2º, 3º)
RANK() OVER (ORDER BY AVG(N.nota) DESC) AS Posicao_Ranking
FROM
    alunos A
INNER JOIN
    notas N ON A.id = N.aluno_id -- Conecta Alunos às Notas
GROUP BY
    A.id, A.nome -- Agrupa para calcular a média de cada aluno
ORDER BY
	Media_Geral desc;