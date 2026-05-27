# 🎵 Music Streaming Database - PostgreSQL

Sistema de banco de dados relacional para uma plataforma de streaming de música desenvolvido em PostgreSQL.

---

# 📚 Estrutura do Banco

O banco possui as seguintes tabelas:

## 👤 Users
Armazena informações dos usuários da plataforma.

| Campo | Tipo |
|---|---|
| id | INTEGER |
| username | VARCHAR(100) |
| email | VARCHAR(150) |
| age | INTEGER |
| nacionality | VARCHAR(50) |

---

## 📱 Contact
Informações de contato dos usuários.

| Campo | Tipo |
|---|---|
| id | INTEGER |
| celular | VARCHAR(20) |
| users_id | INTEGER |

Relacionamento:
- Um contato pertence a um usuário.

---

## 🎤 Artist
Armazena artistas musicais.

| Campo | Tipo |
|---|---|
| id | INTEGER |
| artist_name | VARCHAR(150) |

---

## 🎶 Music
Armazena músicas.

| Campo | Tipo |
|---|---|
| id | INTEGER |
| title | VARCHAR(150) |

---

## 🎧 Artist_Music
Tabela de relacionamento N:N entre artistas e músicas.

| Campo | Tipo |
|---|---|
| artist_id | INTEGER |
| music_id | INTEGER |

---

## 🎼 Genre
Armazena gêneros musicais.

| Campo | Tipo |
|---|---|
| id | INTEGER |
| genre | VARCHAR(100) |

---

## 🎵 Music_Genre
Relacionamento N:N entre músicas e gêneros.

| Campo | Tipo |
|---|---|
| music_id | INTEGER |
| genre_id | INTEGER |

---

## 📂 Playlist
Playlists criadas pelos usuários.

| Campo | Tipo |
|---|---|
| id | INTEGER |
| playlist_name | VARCHAR(100) |
| users_id | INTEGER |

---

## ▶️ Music_Playlist
Relacionamento N:N entre playlists e músicas.

| Campo | Tipo |
|---|---|
| music_id | INTEGER |
| playlist_id | INTEGER |

---

## 📈 Stream_Log
Histórico de reproduções de músicas.

| Campo | Tipo |
|---|---|
| id | INTEGER |
| music_id | INTEGER |
| users_id | INTEGER |
| streamed_at | TIMESTAMP |

---

# 🔗 Relacionamentos

- Um usuário pode possuir várias playlists.
- Uma playlist pode conter várias músicas.
- Uma música pode possuir vários artistas.
- Uma música pode possuir vários gêneros.
- Um usuário pode reproduzir várias músicas.
- O histórico de reprodução é armazenado em `stream_log`.

# 📌 Funcionalidades do Banco

✔️ Cadastro de usuários  
✔️ Cadastro de artistas  
✔️ Cadastro de músicas  
✔️ Associação entre artistas e músicas  
✔️ Associação entre músicas e gêneros  
✔️ Criação de playlists  
✔️ Adição de músicas em playlists  
✔️ Histórico de streams/reproduções  

---

# 🧠 Conceitos Aplicados

- Modelagem relacional
- Relacionamentos N:N
- Foreign Keys
- Primary Keys compostas
- Integridade referencial
- Normalização
- Logs de eventos

---

# 📷 Exemplo de Relacionamento

```text
Users
 └── Playlist
       └── Music_Playlist
              └── Music
                     ├── Artist_Music
                     │      └── Artist
                     └── Music_Genre
                            └── Genre
```

---

# 👨‍💻 Autor

Desenvolvido por Eduardo Dragone Pinheiro Corrêa.
