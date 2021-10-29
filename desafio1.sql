DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE SpotifyClone.artistas (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40)
);
CREATE TABLE SpotifyClone.albuns (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(40),
    artista_id INT,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
);
CREATE TABLE SpotifyClone.musicas (
    musica_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(40),
    artista_id INT,
    album_id INT,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id),
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
);
CREATE TABLE SpotifyClone.planos (
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(3 , 2 ),
    tipo VARCHAR(20)
);
CREATE TABLE SpotifyClone.usuarios (
    usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20),
    idade TINYINT,
    plano_id INT,
    FOREIGN KEY (plano_id)
        REFERENCES planos (plano_id)
);
CREATE TABLE SpotifyClone.usuarios_artistas (
    usuario_id INT,
    artista_id INT,
    CONSTRAINT PRIMARY KEY (usuario_id , artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
);
CREATE TABLE SpotifyClone.historico_de_reproducoes (
    usuario_id INT,
    musica_id INT,
    CONSTRAINT PRIMARY KEY (usuario_id , musica_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (musica_id)
        REFERENCES musicas (musica_id)
);
INSERT INTO SpotifyClone.artistas (nome)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');
INSERT INTO SpotifyClone.albuns (titulo, artista_id)
VALUES ('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);
INSERT INTO SpotifyClone.musicas (titulo, artista_id, album_id)
VALUES ("Soul For Us", 1, 1),
("Reflections Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 1, 2),
("Time Fireworks", 1, 2),
("Magic Circus", 2, 3),
("Honey, So Do I", 2, 3),
("Sweetie, Let's Go Wild", 2, 3),
("She Knows", 2, 3),
("Fantasy For Me", 3, 4),
("Celebration Of More", 3, 4),
("Rock His Everything", 3, 4),
("Home Forever", 3, 4),
("Diamond Power", 3, 4),
("Honey, Let's Be Silly", 3, 4),
("Thang Of Thunder", 4, 5),
("Words Of Her Life", 4, 5),
("Without My Streets", 4, 5);
INSERT INTO SpotifyClone.planos (valor, tipo)
VALUES (0, 'gratuito'),
(7.99, 'familiar'),
(5.99, 'universitário');
INSERT INTO SpotifyClone.usuarios (nome, idade, plano_id)
VALUES ('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);
INSERT INTO SpotifyClone.usuarios_artistas (usuario_id, artista_id)
VALUES (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
INSERT INTO SpotifyClone.historico_de_reproducoes (usuario_id, musica_id)
VALUES (1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
