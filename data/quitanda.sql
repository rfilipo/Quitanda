CREATE TABLE cesta (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT,
    "cliente_id" INTEGER REFERENCES cliente(id) ON DELETE CASCADE ON UPDATE CASCADE,
    "mercadorias_ids" TEXT
, "data" TEXT);
CREATE TABLE conta (
    "id" INTEGER PRIMARY KEY
, "nome" TEXT, 
    "cliente_id" INTEGER REFERENCES cliente(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    "saldo" REAL, "obs" TEXT, "data" TEXT);
CREATE TABLE cliente (
    "id" INTEGER PRIMARY KEY
, "nome" TEXT, "documento" TEXT, "email" TEXT, "senha" TEXT, "obs" TEXT, 
    "endereco_id" INTEGER REFERENCES endereco(id) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE "endereco" (
    "id" INTEGER PRIMARY KEY,
    "pais" TEXT,
    "estado" TEXT,
    "cidade" TEXT,
    "bairro" TEXT,
    "rua" TEXT,
    "numero" TEXT,
    "complemento" TEXT,
    "cep" TEXT,
    "mapa" TEXT
);
CREATE TABLE caixa (
    "id" INTEGER PRIMARY KEY
, "data" TEXT, "valor" REAL, 
    "cliente_id" INTEGER REFERENCES cliente(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    "fornecedor_id" INTEGER REFERENCES fornecedor(id) ON DELETE CASCADE ON UPDATE CASCADE, "descricao" TEXT);
CREATE TABLE fornecedor (
    "id" INTEGER PRIMARY KEY
, "nome" TEXT, "documento" TEXT, "email" TEXT, 
    "endereco_id" INTEGER REFERENCES endereco(id) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE mercadoria (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT
, "valor" REAL, "descricao" TEXT);
CREATE TABLE promocao (
    "id" INTEGER PRIMARY KEY
, "mercadoria_id" INTEGER REFERENCES mercadoria(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    "valor" REAL, "promo_url" TEXT, "descricao" TEXT);
CREATE TABLE user (
    "id" INTEGER PRIMARY KEY,
    "email" TEXT,
    "password" TEXT
, "funcao" TEXT);
CREATE TABLE entrega (
    "id" INTEGER PRIMARY KEY,
    "endereco_id" INTEGER REFERENCES endereco(id) ON DELETE CASCADE ON UPDATE CASCADE,
    "cliente_id" INTEGER REFERENCES cliente(id) ON DELETE CASCADE ON UPDATE CASCADE,
    "obs" TEXT,
    "valor" REAL,
    "cesta_id" INTEGER REFERENCES cesta(id) ON DELETE CASCADE ON UPDATE CASCADE
, "data" TEXT);
CREATE TABLE stack (
    "id" INTEGER PRIMARY KEY,
    "conteudo" TEXT
, "titulo" TEXT, "url" TEXT);
