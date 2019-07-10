use faq;

insert into endereco values
(1, '84015600', 'PR', 'Ponta Grossa', 'Jardim Carvalho', 'Jaime pinto rosas', '56'),
(2, '24339156', 'PR', 'Ponta Grossa', 'Nova Russia', 'Jaime pinto rosas', '213'),
(3, '59875004', 'RJ', 'Rio de Janeiro', 'Anchieta', 'Amaro da silveira', '100'),
(4, '77927430', 'RJ', 'Rio de Janeiro', 'Nilopolis', 'Rua amaurir', '3213'),
(5, '40205933', 'SP', 'Peruibi', 'Sao judas', 'Jose constancio', '21'),
(6, '53311527', 'CE', 'Fortaleza', 'Jo Soares', 'Presidente Nicholas Damasceno', '314'),
(7, '85966381', 'RS', 'Porto Triste', 'Andrey Naligastki', 'Coronel Jefferson Michael', '3233');

insert into loja values
(1, 'Organizacoes Taba', '40028922', 6);

insert into consumidor values
(DEFAULT, 'Creisson das Rosas', '40204020', '23032123002', '1978-02-10', 'cresisinho_playstation@yahoo.com', '1'),
(DEFAULT, 'Creisson Jucelino', '22335678', '86071292322', '1950-04-23', 'seucreison@bol.com', '2'),
(DEFAULT, 'Jurandir Silva', '68542586', '96893592220', '1978-02-03', 'judias@terra.com', '3'),
(DEFAULT, 'Jurandir Pinto', '28522534', '23925742230', '1988-02-08', 'juradinho_Playson@hotmail.com', '4'),
(DEFAULT, 'Jorge Lenovo', '992922992', '56238238883', '1990-12-21', 'jorjao_da_loja@gmail.com', '5'),
(DEFAULT, 'Homer Simpson', '99956431', '15672098425', '1942-05-01', 'foxcenturies@vol.com.br', '7');

insert into funcionario values
(DEFAULT, 'Kann I. Relp', '1'),
(DEFAULT, 'Jarbas Rosas', '1'),
(DEFAULT, 'Ronaldinho Gaucho', '1');

Insert into FAQ values
(default,'Meu computador não está funcionando o que eu faço?', 'Verifique se ele está ligado na tomada.'),
(default,'Minha batedeira queimou, o que devo fazer?', 'Verifique se ela está no prazo de garantia, se sim, então leve até a nossa filial mais proxima, caso contrário procure um especialista em reparos.'),
(default,'Meu armario não foi montado corretamente, devo processa-los?', 'Não, apenas solicite uma revisão na montagem pelo numero 40028922 e ficaremos felizes em revisar a montagem de seu movel.');

Insert into produto_servico values
(default,'Montagem de moveis','3 dias','500.00','Equipe especializada irá no endereço e realiza a montagem do movel','serviço', '1'),
(default,'Computador','90 dias','999.99','Notebook celeron, 2GB RAM, 250 GB HD','produto', '1'),
(default,'Batedeira','365 dias','1459.74','Batedeira planetaria industrial bate tudo krastemp armo','produto', '1'),
(default,'Notebook','365 dias','1459.74','Batedeira planetaria industrial bate tudo krastemp armo','produto', '1'),
(default,'Celular','365 dias','1459.74','Batedeira planetaria industrial bate tudo krastemp armo','produto', '1');

insert into lojafaq values
('1','1'),
('2','1'),
('3','1');

insert into venda values
(DEFAULT, '2018-02-14 18:00:54', '1', '2', '1', '1'),
(DEFAULT, '2018-02-15 18:00:54', '1', '2', '1', '2'),
(DEFAULT, '2018-02-16 18:00:54', '2', '2', '1', '3'),
(DEFAULT, '2018-02-17 18:00:54', '2', '3', '1', '4'),
(DEFAULT, '2018-02-18 18:00:54', '2', '3', '1', '5'),
(DEFAULT, '2018-02-19 18:00:54', '2', '1', '1', '6'),
(DEFAULT, '2019-02-19 18:00:54', '2', '4', '1', '6'),
(DEFAULT, '2018-02-19 18:00:54', '2', '4', '1', '6'),
(DEFAULT, '2017-02-19 18:00:54', '2', '5', '1', '6');

Insert into contato values
(default,'2018-02-28 18:00:54','Reclamacao','Internet','Meu computador não está ligando','1', '1','1'),
(default,'2018-02-28 18:00:54','Reclamacao','Loja','Meu computador não chegou','2', '1','2'),
(default,'2018-02-28 18:00:54','Reclamacao','Telefone','A vasilha da batedeira quebrou','4', '1','4'),
(default,'2019-02-28 18:00:54','Reclamacao','Internet','A notebook da batedeira quebrou','6', '1','7');

insert into respusu values
('Foi encaminhado resposta ao usuario','2018-02-19 18:00:54', 'Faça x', '1','1','3'),
('Foi encaminhado resposta ao usuario','2018-02-19 18:00:54', 'Faça x', '2','2','3'),
('Foi encaminhado resposta ao usuario','2018-02-19 18:00:54', 'Faça x', '3','4','3');

