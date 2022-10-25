DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

    CREATE TABLE SpotifyClone.account(
      account_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,      
      account_type VARCHAR(45) NOT NULL,
      price DECIMAL(3, 2) NOT NULL      
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      user_name VARCHAR(100) NOT NULL,
      age INT NOT NULL,
      account_id INT NOT NULL,
      signing_date DATETIME NOT NULL,
      FOREIGN KEY (account_id)
        REFERENCES account (account_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
    artist_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.song(
    song_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    release_year YEAR NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES album (album_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.song_history(
      song_id INT NOT NULL,
      user_id INT NOT NULL,
      playback_date DATETIME,
      PRIMARY KEY (song_id, user_id),
      FOREIGN KEY (user_id)
        REFERENCES user (user_id),
      FOREIGN KEY (song_id)
        REFERENCES song (song_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.followed_artist(
    user_id INT,
    artist_id INT,    
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id)
        REFERENCES user (user_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.account (account_type, price)
  VALUES
    ("gratuito", 0.00),
    ("familiar", 7.99),
    ("universitário", 5.99),
    ("pessoal", 6.99);    

  INSERT INTO SpotifyClone.user (account_id, user_name, age, signing_date)
  VALUES
    (1, "Barbara Liskov",	82, "2019-10-20"),
    (1, "Robert Cecil Martin", 58, "2017-01-06"),
    (2, "Ada Lovelace",	37, "2017-12-30"),
    (2, "Martin Fowler",	46, "2017-01-17"),
    (2, "Sandi Metz",	58, "2018-04-29"),
    (3, "Paulo Freire",	19, "2018-02-14"),
    (3, "Bell Hooks",	26, "2018-01-05"),
    (4, "Christopher Alexander",	85, "2019-06-05"),
    (4, "Judith Butler",	45, "2020-05-13"),
    (4, "Jorge Amado",	58, "2017-02-17");

  INSERT INTO SpotifyClone.artist (artist_name)
  VALUES
    ("Beyoncé"),
    ("Queen"),
    ("Elis Regina"),
    ("Baco Exu do Blues"),
    ("Blind Guardian"),
    ("Nina Simone");

INSERT INTO SpotifyClone.album (artist_id, album_name)
VALUES
    (1, "Renaissance"),
    (2, "Jazz"),
    (2, "Hot Space"),
    (3, "Falso Brilhante"),
    (3, "Vento de Maio"),
    (4, "QVVJFA?"),
    (5, "Somewhere Far Beyond"),
    (6, "I Put A Spell On You");

INSERT INTO SpotifyClone.song (artist_id, album_id, song_name, duration, release_year)
VALUES
    (1, 1, "BREAK MY SOUL", 279, 2022),
    (1, 1, "VIRGO’S GROOVE", 369, 2022),
    (1, 1, "ALIEN SUPERSTAR", 116, 2022),
    (2, 2, "Don’t Stop Me Now", 203, 1978),
    (2, 3, "Under Pressure", 152, 1982),
    (3, 4, "Como Nossos Pais", 105, 1998),
    (3, 5, "O Medo de Amar é o Medo de Ser Livre", 207, 2001),
    (4, 6, "Samba em Paris", 267, 2003),
    (5, 7, "The Bard’s Song", 244, 2007),
    (6, 8, "Feeling Good", 100, 2012);


INSERT INTO SpotifyClone.song_history (user_id, song_id, playback_date)
VALUES
    (1, 8, "2022-02-28 10:45:55"),
    (1, 2, "2020-05-02 05:30:35"),
    (1, 10, "2020-03-06 11:22:33"),
    (2, 10, "2022-08-05 08:05:17"),
    (2, 7, "2020-01-02 07:40:33"),
    (3, 10, "2020-11-13 16:55:13"),
    (3, 2, "2020-12-05 18:38:30"),
    (4, 8, "2021-08-15 17:10:10"),
    (5, 8, "2022-01-09 01:44:33"),
    (5, 5, "2020-08-06 15:23:43"),
    (6, 7, "2017-01-24 00:31:17"),
    (6, 1, "2017-10-12 12:35:20"),
    (7, 4, "2011-12-15 22:30:49"),
    (8, 4, "2012-03-17 14:56:41"),
    (9, 9, "2022-02-24 21:14:22"),
    (10, 3, "2015-12-13 08:30:22");

INSERT INTO SpotifyClone.followed_artist (user_id, artist_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

  