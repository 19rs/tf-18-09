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
        primary key(id),
        foreign key (categoria_produto_id) references tb_categoria_produto(id)  ON DELETE CASCADE);

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
(1, 1, "Xis Salada", "Maionese, milho, ervilha, alface, tomate, queijo, presunto, ovo e bife.", 18.00, "Xis Salada.png"),
(2, 1, "Xis Coração", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, coração.", 22.00, "Xis Coração.png"),
(3, 1, "Xis Calabresa", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, calabresa.", 19.00, "Xis Calabresa.png"),
(4, 1, "Xis Frango", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, frango.", 19.00, "Xis Frango.png"),
(5, 1, "Xis Bacon", "Maionese, milho, ervilha, tomate, alface, queijo, presunto, ovo, bacon.", 22.00, "Xis Bacon.png"),
(6, 1, "Xis Filé", "Maionese, milho, ervilha, tomate, queijo, presunto, ovo, filé.", 25.00, "Xis Filé.png"),
(7, 1, "Xis Frango Rei", "Alface, tomate, milho, ervilha, queijo, frango, ovo, maionese.", 25.00, "Xis Frango Rei.png"),
(8, 1, "Xis Coração c/ Bacon", "Pão, maionese verde, milho, ervilha, tomate, coração suculentos, bacon em cubos, queijo mussarela, requeijão, ovo, alface.", 38.00, "Xis Coração c  Bacon.png"),
(9, 1, "Xis do Gaúcho", "Sabor inconfundível....Pão, maionese verde, calabresa, ovo, queijo, cebola fritinha, alface e batata frita.", 26.00, "Xis do Gaúcho.png"),
(10, 1, "Xis Monstro", "Pão, maionese verde do rei, milho, ervilha, tomate, 2 hambúrguer, frango, bacon, calabresa, filé, picanha, ovo, queijo mussarela, alface.", 43.00, "Xis Monstro.png"),
(11, 1, "Batata Frita P", "Porção de 300g.", 22.00, "Batata Frita P.png"),
(12, 2, "Torta Holandesa", "Base crocante de biscoito amanteigado e recheio de cream cheese e chocolate branco.", 24.00, "Torta Holandesa.png"),
(13, 2, "Torta de Sorvete", "O tradicional sorvete de leite condensado da vovó, com merengue e mousse de chocolate.", 24.00, "Torta de Sorvete.png"),
(14, 3, "Coca 600ml", "Gelada", 5.00, "Coca 600ml.png"),
(15, 3, "Cerveja Amstel 473ml", "Puro malte, gelada", 8.00, "Cerveja Amstel 473ml.png"),
(16, 1, "Sanduíche Prensado", "Maionese, alface, queijo, presunto.", 19.00, "Sanduíche Prensado.png"),
(17, 1, "Cachorro Salsicha", "Maionese, molho, milho, ervilha e salsicha.", 17.00, "Cachorro Salsicha.png"),
(18, 1, "Torrada Especial", "3 fatias de pão, maionese, presunto, queijo, ovo, tomate, milho e ervilha.", 15.00, "Torrada Especial.png");

