    drop database tchefooddb;
    create database tchefooddb;
    use tchefooddb;
    

	CREATE TABLE tb_usuario (
		id INT PRIMARY KEY AUTO_INCREMENT,
		nome VARCHAR(150) NOT NULL,
		email VARCHAR(150) NOT NULL UNIQUE,
		senha VARCHAR(100) NOT NULL,
		papel VARCHAR(50) NOT NULL,
		telefone VARCHAR(50) NOT NULL,
		data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

    create table tb_categoria_produto(
        id  int auto_increment,
        descricao   varchar(100) not null,
        primary key(id));

    create table tb_produto(
        id  int auto_increment,
        categoria_produto_id    int not null,
        nome varchar(200) not null,
        descricao  varchar(250) not null,
        preco   double not null,
        imagem varchar(200) DEFAULT "/images/null.png",
        thumb varchar(200) DEFAULT "/thumbs/thumb-null.png",
        primary key(id),
        foreign key (categoria_produto_id) references tb_categoria_produto(id)  ON DELETE RESTRICT);

    create table tb_forma_pagamento(
        id int  auto_increment,
        nome varchar(100),
        descricao varchar(100) not null,
        primary key(id));

    create table tb_pedido(
        id  int auto_increment,
        usuario_id  int not null,
        forma_pagamento_id int not null,
        data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        status_pagamento  int not null DEFAULT 0,
        status_pedido int DEFAULT 0,
        total   double not null DEFAULT 0.0,
        primary key(id),
        foreign key (usuario_id) references tb_usuario(id) ON DELETE CASCADE,
        foreign key (forma_pagamento_id) references tb_forma_pagamento(id) ON DELETE CASCADE);

    create table tb_itens_pedido(
        id  int auto_increment,
        pedido_id   int not null,
        produto_id  int not null,
        quantidade  int not null,
        opcional varchar(200),
        primary key(id),
        foreign key (pedido_id) references tb_pedido(id) ON DELETE CASCADE,
        foreign key (produto_id) references tb_produto(id) ON DELETE CASCADE);


INSERT INTO tb_usuario VALUES
(1, "Teste", "teste123@gmail.com", "1234", "admin", "51999888777", NOW(), NOW());

INSERT INTO tb_categoria_produto VALUES
(1, "Lanche"),
(2, "Sobremesa"),
(3, "Bebida");

-- ver depois certinho
INSERT INTO tb_forma_pagamento(id, descricao) VALUES
(1, "Dinheiro"),
(2, "Cartão"),
(3, "PIX");


INSERT INTO tb_produto VALUES
(1, 1, "Xis Salada", "Maionese, milho, ervilha, alface, tomate, queijo, presunto, ovo e bife.", 18.00, "/images/Xis Salada.png", "/thumbs/Xis Salada.png"),
(2, 1, "Xis Coração", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, coração.", 22.00, "/images/Xis Coração.png", "/thumbs/Xis Coração.png"),
(3, 1, "Xis Calabresa", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, calabresa.", 19.00, "/images/Xis Calabresa.png", "/thumbs/Xis Calabresa.png"),
(4, 1, "Xis Frango", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, frango.", 19.00, "/images/Xis Frango.png", "/thumbs/Xis Frango.png"),
(5, 1, "Xis Bacon", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, bacon.", 22.00, "/images/Xis Bacon.png", "/thumbs/Xis Bacon.png"),
(6, 1, "Xis Filé", "Maionese, milho, ervilha, tomate, queijo, presunto, ovo, filé.", 25.00, "/images/Xis Filé.png", "/thumbs/Xis Filé.png"),
(7, 1, "Xis Frango Rei", "Alface, tomate, milho, ervilha, queijo, frango, ovo, maionese.", 25.00, "/images/Xis Frango Rei.png", "/thumbs/Xis Frango Rei.png"),
(8, 1, "Xis Coração c/ Bacon", "Pão, maionese verde, milho, ervilha, tomate, coração suculentos, bacon em cubos, queijo mussarela, requeijão, ovo, alface.", 38.00, "/images/Xis Coração c  Bacon.png", "/thumbs/Xis Coração c  Bacon.png"),
(9, 1, "Xis do Gaúcho", "Sabor inconfundível....Pão, maionese verde, calabresa, ovo, queijo, cebola fritinha, alface e batata frita.", 26.00, "/images/Xis do Gaúcho.png", "/thumbs/Xis do Gaúcho.png"),
(10, 1, "Xis Monstro", "Pão, maionese verde do rei, milho, ervilha, tomate, 2 hambúrguer, frango, bacon, calabresa, filé, picanha, ovo, queijo mussarela, alface.", 43.00, "/images/Xis Monstro.png", "/thumbs/Xis Monstro.png"),
(11, 1, "Batata Frita P", "Porção de 300g.", 22.00, "/images/Batata Frita P.png", "/thumbs/Batata Frita P.png"),
(12, 2, "Torta Holandesa", "Base crocante de biscoito amanteigado e recheio de cream cheese e chocolate branco.", 24.00, "/images/Torta Holandesa.png", "/thumbs/Torta Holandesa.png"),
(13, 2, "Torta de Sorvete", "O tradicional sorvete de leite condensado da vovó, com merengue e mousse de chocolate.", 24.00, "/images/Torta de Sorvete.png", "/thumbs/Torta de Sorvete.png"),
(14, 3, "Coca 600ml", "Gelada", 5.00, "/images/Coca 600ml.png", "/thumbs/Coca 600ml.png"),
(15, 3, "Cerveja Amstel 473ml", "Puro malte, gelada", 8.00, "/images/Cerveja Amstel 473ml.png", "/thumbs/Cerveja Amstel 473ml.png"),
(16, 1, "Sanduíche Prensado", "Maionese, alface, queijo, presunto.", 19.00, "/images/Sanduíche Prensado.png", "/thumbs/Sanduíche Prensado.png"),
(17, 1, "Cachorro Salsicha", "Maionese, molho, milho, ervilha e salsicha.", 17.00, "/images/Cachorro Salsicha.png", "/thumbs/Cachorro Salsicha.png"),
(18, 1, "Torrada Especial", "3 fatias de pão, maionese, presunto, queijo, ovo, tomate, milho e ervilha.", 15.00, "/images/Torrada Especial.png", "/thumbs/Torrada Especial.png"),
(19, 1, "Xis Monstro", "Pão, maionese verde do rei, milho, ervilha, tomate, 2 hambúrguer, frango, bacon, calabresa, filé, picanha, ovo, queijo mussarela, alface.", 43.00, "/images/Xis Monstro.png", "/thumbs/Xis Monstro.png"),
(20, 1, "Batata Frita P", "Porção de 300g.", 22.00, "/images/Batata Frita P.png", "/thumbs/Batata Frita P.png"),
(21, 2, "Torta Holandesa", "Base crocante de biscoito amanteigado e recheio de cream cheese e chocolate branco.", 24.00, "/images/Torta Holandesa.png", "/thumbs/Torta Holandesa.png"),
(22, 2, "Torta de Sorvete", "O tradicional sorvete de leite condensado da vovó, com merengue e mousse de chocolate.", 24.00, "/images/Torta de Sorvete.png", "/thumbs/Torta de Sorvete.png"),
(23, 3, "Coca 600ml", "Gelada", 5.00, "/images/Coca 600ml.png", "/thumbs/Coca 600ml.png"),
(24, 3, "Cerveja Amstel 473ml", "Puro malte, gelada", 8.00, "/images/Cerveja Amstel 473ml.png", "/thumbs/Cerveja Amstel 473ml.png"),
(25, 1, "Sanduíche Prensado", "Maionese, alface, queijo, presunto.", 19.00, "/images/Sanduíche Prensado.png", "/thumbs/Sanduíche Prensado.png"),
(26, 1, "Cachorro Salsicha", "Maionese, molho, milho, ervilha e salsicha.", 17.00, "/images/Cachorro Salsicha.png", "/thumbs/Cachorro Salsicha.png"),
(27, 1, "Torrada Especial", "3 fatias de pão, maionese, presunto, queijo, ovo, tomate, milho e ervilha.", 15.00, "/images/Torrada Especial.png", "/thumbs/Torrada Especial.png"),
(28, 1, "Xis do Gaúcho", "Sabor inconfundível....Pão, maionese verde, calabresa, ovo, queijo, cebola fritinha, alface e batata frita.", 26.00, "/images/Xis do Gaúcho.png", "/thumbs/Xis do Gaúcho.png"),
(29, 1, "Xis Monstro", "Pão, maionese verde do rei, milho, ervilha, tomate, 2 hambúrguer, frango, bacon, calabresa, filé, picanha, ovo, queijo mussarela, alface.", 43.00, "/images/Xis Monstro.png", "/thumbs/Xis Monstro.png"),
(30, 1, "Batata Frita P", "Porção de 300g.", 22.00, "/images/Batata Frita P.png", "/thumbs/Batata Frita P.png"),
(31, 2, "Torta Holandesa", "Base crocante de biscoito amanteigado e recheio de cream cheese e chocolate branco.", 24.00, "/images/Torta Holandesa.png", "/thumbs/Torta Holandesa.png"),
(32, 2, "Torta de Sorvete", "O tradicional sorvete de leite condensado da vovó, com merengue e mousse de chocolate.", 24.00, "/images/Torta de Sorvete.png", "/thumbs/Torta de Sorvete.png"),
(33, 3, "Coca 600ml", "Gelada", 5.00, "/images/Coca 600ml.png", "/thumbs/Coca 600ml.png"),
(34, 3, "Cerveja Amstel 473ml", "Puro malte, gelada", 8.00, "/images/Cerveja Amstel 473ml.png", "/thumbs/Cerveja Amstel 473ml.png"),
(35, 1, "Sanduíche Prensado", "Maionese, alface, queijo, presunto.", 19.00, "/images/Sanduíche Prensado.png", "/thumbs/Sanduíche Prensado.png"),
(36, 1, "Cachorro Salsicha", "Maionese, molho, milho, ervilha e salsicha.", 17.00, "/images/Cachorro Salsicha.png", "/thumbs/Cachorro Salsicha.png"),
(37, 1, "Torrada Especial", "3 fatias de pão, maionese, presunto, queijo, ovo, tomate, milho e ervilha.", 15.00, "/images/Torrada Especial.png", "/thumbs/Torrada Especial.png"),
(38, 1, "Xis do Gaúcho", "Sabor inconfundível....Pão, maionese verde, calabresa, ovo, queijo, cebola fritinha, alface e batata frita.", 26.00, "/images/Xis do Gaúcho.png", "/thumbs/Xis do Gaúcho.png"),
(39, 1, "Xis Monstro", "Pão, maionese verde do rei, milho, ervilha, tomate, 2 hambúrguer, frango, bacon, calabresa, filé, picanha, ovo, queijo mussarela, alface.", 43.00, "/images/Xis Monstro.png", "/thumbs/Xis Monstro.png"),
(40, 1, "Xis Coração c/ Bacon", "Pão, maionese verde, milho, ervilha, tomate, coração suculentos, bacon em cubos, queijo mussarela, requeijão, ovo, alface.", 38.00, "/images/Xis Coração c  Bacon.png", "/thumbs/Xis Coração c  Bacon.png"),
(41, 1, "Xis do Gaúcho", "Sabor inconfundível....Pão, maionese verde, calabresa, ovo, queijo, cebola fritinha, alface e batata frita.", 26.00, "/images/Xis do Gaúcho.png", "/thumbs/Xis do Gaúcho.png"),
(42, 1, "Xis Monstro", "Pão, maionese verde do rei, milho, ervilha, tomate, 2 hambúrguer, frango, bacon, calabresa, filé, picanha, ovo, queijo mussarela, alface.", 43.00, "/images/Xis Monstro.png", "/thumbs/Xis Monstro.png"),
(43, 1, "Batata Frita P", "Porção de 300g.", 22.00, "/images/Batata Frita P.png", "/thumbs/Batata Frita P.png"),
(44, 2, "Torta Holandesa", "Base crocante de biscoito amanteigado e recheio de cream cheese e chocolate branco.", 24.00, "/images/Torta Holandesa.png", "/thumbs/Torta Holandesa.png"),
(45, 2, "Torta de Sorvete", "O tradicional sorvete de leite condensado da vovó, com merengue e mousse de chocolate.", 24.00, "/images/Torta de Sorvete.png", "/thumbs/Torta de Sorvete.png"),
(46, 3, "Coca 600ml", "Gelada", 5.00, "/images/Coca 600ml.png", "/thumbs/Coca 600ml.png"),
(47, 3, "Cerveja Amstel 473ml", "Puro malte, gelada", 8.00, "/images/Cerveja Amstel 473ml.png", "/thumbs/Cerveja Amstel 473ml.png"),
(48, 1, "Sanduíche Prensado", "Maionese, alface, queijo, presunto.", 19.00, "/images/Sanduíche Prensado.png", "/thumbs/Sanduíche Prensado.png"),
(49, 1, "Cachorro Salsicha", "Maionese, molho, milho, ervilha e salsicha.", 17.00, "/images/Cachorro Salsicha.png", "/thumbs/Cachorro Salsicha.png"),
(50, 1, "Torrada Especial", "3 fatias de pão, maionese, presunto, queijo, ovo, tomate, milho e ervilha.", 15.00, "/images/Torrada Especial.png", "/thumbs/Torrada Especial.png"),
(51, 1, "Xis Monstro", "Pão, maionese verde do rei, milho, ervilha, tomate, 2 hambúrguer, frango, bacon, calabresa, filé, picanha, ovo, queijo mussarela, alface.", 43.00, "/images/Xis Monstro.png", "/thumbs/Xis Monstro.png"),
(52, 1, "Batata Frita P", "Porção de 300g.", 22.00, "/images/Batata Frita P.png", "/thumbs/Batata Frita P.png"),
(53, 2, "Torta Holandesa", "Base crocante de biscoito amanteigado e recheio de cream cheese e chocolate branco.", 24.00, "/images/Torta Holandesa.png", "/thumbs/Torta Holandesa.png"),
(54, 2, "Torta de Sorvete", "O tradicional sorvete de leite condensado da vovó, com merengue e mousse de chocolate.", 24.00, "/images/Torta de Sorvete.png", "/thumbs/Torta de Sorvete.png");