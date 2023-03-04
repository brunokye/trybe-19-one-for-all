DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  valor DECIMAL(10,2) NOT NULL
);

INSERT INTO plano (nome, valor) VALUES
('gratuito', 0),
('pessoal', 6.99),
('familiar', 7.99),
('universitário', 5.99);

CREATE TABLE pessoa_artista (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL
);

INSERT INTO pessoa_artista (nome) VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

CREATE TABLE album (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES pessoa_artista(id)
);

INSERT INTO album (nome, artista_id) VALUES
('Renaissance', 1),
('Jazz', 2),
('Hot Space', 2),
('Falso Brilhante', 3),
('Vento de Maio', 3),
('QVVJFA?', 4),
('Somewhere Far Beyond', 5),
('I Put A Spell On You', 6);

CREATE TABLE cancao (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(id)
);

INSERT INTO cancao (nome, album_id) VALUES
('BREAK MY SOUL', 1),
('VIRGO''S GROOVE', 1),
('ALIEN SUPERSTAR', 1),
('Don''t Stop Me Now', 2),
('Under Pressure', 3),
('Como Nossos Pais', 4),
('O Medo de Amar é o Medo de Ser Livre', 5),
('Samba em Paris', 6),
('The Bard''s Song', 7),
('Feeling Good', 8);

CREATE TABLE pessoa_usuaria (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  assinatura DATE NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES plano(id)
);

INSERT INTO pessoa_usuaria (nome, idade, plano_id, assinatura) VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 3, '2017-12-30'),
('Martin Fowler', 46, 3, '2017-01-17'),
('Sandi Metz', 58, 3, '2018-04-29'),
('Paulo Freire', 19, 4, '2018-02-14'),
('Bell Hooks', 26, 4, '2018-01-05'),
('Christopher Alexander', 85, 2, '2019-06-05'),
('Judith Butler', 45, 2, '2020-05-13'),
('Jorge Amado', 58, 2, '2017-02-17');

CREATE TABLE historico_reproducao (
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  reproducao DATETIME NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES pessoa_usuaria(id),
  FOREIGN KEY (cancao_id) REFERENCES cancao(id),
  CONSTRAINT PRIMARY KEY(usuario_id, cancao_id)
);

INSERT INTO historico_reproducao (usuario_id, cancao_id, reproducao) VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');

CREATE TABLE artista_seguido (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES pessoa_usuaria(id),
  FOREIGN KEY (artista_id) REFERENCES pessoa_artista(id),
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
);

INSERT INTO artista_seguido (usuario_id, artista_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 1),
(6, 6),
(7, 6),
(9, 3),
(10, 2);