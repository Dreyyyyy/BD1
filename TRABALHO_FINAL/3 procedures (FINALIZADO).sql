#### endereco
DELIMITER //
create procedure sp_insendereco (in pcep numeric(9),puf varchar(2),pcidade varchar(150),pbairro varchar(150),prua varchar(150),pnumero numeric(10), out mensagem varchar(150))
begin
	if( (pcep is not null) and 
    (puf is not null) and 
    (pcidade is not null) and 
    (pbairro is not null) and 
    (prua is not null) and 
    (pnumero is not null) and
    (not exists(select * from endereco where cidade like pcidade and bairro like pbairro and rua like prua and numero = pnumero and cep = pcep))) then
		begin
			insert into endereco
            values (default, pcep, puf, pcidade, pbairro, prua, pnumero);
            set mensagem = 'Endereco inserido com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altendereco (in pid int,pcep numeric(9),puf varchar(2),pcidade varchar(150),pbairro varchar(150),prua varchar(150),pnumero numeric(10), out mensagem varchar(150))
begin
	if( (pcep is not null) and 
    (puf is not null) and 
    (pcidade is not null) and 
    (pbairro is not null) and 
    (prua is not null) and 
    (pnumero is not null) and
    (exists(select * from endereco where IDendereco = pid))) then
		begin
			update endereco
            set cep = pcep, uf = puf, cidade = pcidade, bairro = pbairro, rua = prua, numero = pnumero
            where IDendereco = pid;
            set mensagem = 'Endereco alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

#### consumidor
DELIMITER //
create procedure sp_insconsumidor (in pnome varchar(150),ptelefone numeric(12),pcpf numeric(11),pdataNasc date,pemail varchar(150),pidendereco int, out mensagem varchar(150))
begin
	if( (pnome is not null) and 
    (pcpf is not null) and 
    ((pemail is not null) or (ptelefone)) and
    (not exists(select * from consumidor where cpf = pcpf)) and
    (exists(select * from endereco where IDendereco = pidendereco))) then
		begin
			insert into consumidor
            values (default, pnome, ptelefone, pcpf, pdataNasc, pemail, pidendereco);
            set mensagem = 'Consumidor registrado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altconsumidor (in pIDconsumidor int, pnome varchar(150),ptelefone numeric(12),pcpf numeric(11),pdataNasc date,pemail varchar(150),pidendereco int, out mensagem varchar(150))
begin
	if( (pnome is not null) and 
    (pcpf is not null) and 
    ((pemail is not null) or (ptelefone)) and
    (exists(select * from endereco where IDendereco = pidendereco)) and
    (exists(select * from consumidor where IDconsumidor = pIDconsumidor))) then
		begin
			update consumidor
            set nome = pnome, telefone = ptelefone, cpf = pcpf, dataNasc = pdataNasc, email = pemail, IDendereco = pidendereco
            where IDconsumidor = pIDconsumidor;
            set mensagem = 'Consumidor registrado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

#### funcionario
DELIMITER //
create procedure sp_insfuncionario (in pnome varchar(150),pIDloja int, out mensagem varchar(150))
begin
	if (pnome is not null) and
        (exists(select * from loja where IDloja = pIDloja))
		then 
        begin
			insert into funcionario
            values (default,pnome, pIDloja);
            set mensagem = 'Funcionario registrado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altfuncionario (in pIDFuncionario int, pnome varchar(150), pIDloja int, out mensagem varchar(150))
begin
	if( (pnome is not null) and 
    (exists(select * from funcionario where IDfuncionario = pIDfuncionario))and
    (exists(select * from loja where IDloja = pIDloja))) then
		begin
			update funcionario
            set nome = pnome, IDloja = pIDloja 
            where IDfuncionario = pIDfuncionario;
            set mensagem = 'Funcionario registrado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

#### faq
DELIMITER //
create procedure sp_insfaq(in ppergunta varchar(150), presposta varchar(150), out mensagem varchar(150))
begin
	if( (ppergunta is not null) and 
    (presposta is not null) and 
    (not exists(select * from faq where pergunta like ppergunta and resposta like presposta))) then
		begin
			insert into faq
            values (default, ppergunta, presposta);
            set mensagem = 'FAQ inserido com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altfaq (in pid int, ppergunta varchar(150), presposta varchar(150), out mensagem varchar(150))
begin
	if( (ppergunta is not null) and 
    (presposta is not null) and 
    (exists(select * from faq where IDfaq = pid))) then
		begin
			update faq
            set pergunta = ppergunta, resposta = presposta
            where IDfaq = pid;
            set mensagem = 'FAQ alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

#### contato
DELIMITER //
create procedure sp_inscontato (in pdatacont datetime, passunto varchar(150), ptipocontato varchar(150), pdescricao varchar(150), pIDconsumidor int, pIDloja int, pIDvenda int, out mensagem varchar(150))
begin
	if ((pdatacont is not null) and
		(passunto is not null) and
        (ptipocontato is not null) and
        (pdescricao is not null) and
        (exists(select * from consumidor where IDconsumidor = pIDconsumidor)) and
        (exists(select * from venda where IDvenda = pIDvenda)) and
        (exists(select * from loja where IDloja = pIDloja)))
		then 
        begin
			insert into contato
            values (default, pdatacont, passunto, ptipocontato, pdescricao,pIDconsumidor, pIDloja, pIDvenda);
            set mensagem = 'Contato registrado com sucesso';
		end;
            
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altcontato (in pid int, pdatacont datetime, passunto varchar(150), ptipocontato varchar(150), pdescricao varchar(150), pIDconsumidor int, pIDloja int, pIDvenda int, out mensagem varchar(150))
begin
	if ((pdatacont is not null) and
		(passunto is not null) and
        (ptipocontato is not null) and
        (pdescricao is not null) and
        (exists(select * from consumidor where IDconsumidor = pIDconsumidor)) and
        (exists(select * from contato where IDcontato = pid)) and
        (exists(select * from venda where IDvenda = pIDvenda)) and
        (exists(select * from loja where IDloja = pIDloja)))
		then 
        begin
            update contato
            set dataCont = pdatacont, assunto=passunto, tipodecontato=ptipocontato, descricao=pdescricao, IDconsumidor=pIDconsumidor, IDloja=pIDloja, IDvenda=pIDvenda 
            where IDcontato = pid;
            set mensagem = 'Contato alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end

//
DELIMITER ;

#### produto
DELIMITER //
create procedure sp_insproduto (in pnome varchar(150), pgarantia varchar(150), ppreco decimal(10,2), pdescricao varchar(150), pcategoria varchar(150), pIDloja int, out mensagem varchar(150))
begin
	if ((pnome is not null) and
		(pgarantia is not null) and
        (ppreco is not null) and
        (pdescricao is not null) and
        (pcategoria is not null) and
        (exists(select * from loja where IDloja = pIDloja)))
		then 
        begin
			insert into produto_servico
            values (default, pnome, pgarantia, ppreco, pdescricao,pcategoria, pIDloja);
            set mensagem = 'Produto_Servico registrado com sucesso';
		end;
            
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altproduto (in pid int,  pnome varchar(150), pgarantia varchar(150), ppreco decimal(10,2), pdescricao varchar(150), pcategoria varchar(150), pIDloja int, out mensagem varchar(150))
begin
	if ((pnome is not null) and
		(pgarantia is not null) and
        (ppreco is not null) and
        (pdescricao is not null) and
        (pcategoria is not null) and
        (exists(select * from loja where IDloja = pIDloja))and
        (exists(select * from produto_servico where IDproduto_servico = pid)))
		then 
        begin
            update produto_servico
            set nome = pnome, garantia=pgarantia, preco=ppreco, descricao=pdescricao, categoria=pcategoria, IDloja=pIDloja 
            where IDproduto_servico = pid;
            set mensagem = 'Produto_servico alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end

//
DELIMITER ;

#### loja
DELIMITER //
create procedure sp_insloja (in pnome varchar(150), ptelefone decimal(12),  pIDendereco int, out mensagem varchar(150))
begin
	if ((pnome is not null) and
		(ptelefone is not null) and
        (exists(select * from endereco where IDendereco = pIDendereco)))
		then 
        begin
			insert into loja
            values (default, pnome, ptelefone , pIDendereco);
            set mensagem = 'loja registrado com sucesso';
		end;
            
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altloja(in pid int,  pnome varchar(150), ptelefone decimal(12), pIDendereco int, out mensagem varchar(150))
begin
	if ((pnome is not null) and
		(ptelefone is not null) and
        (exists(select * from endereco where IDendereco = pIDendereco))and
        (exists(select * from loja where IDloja = pid)))
		then 
        begin
            update loja
            set nome = pnome, telefone=ptelefone, IDendereco=pIDendereco 
            where IDloja= pid;
            set mensagem = 'Endereco alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end

//
DELIMITER ;

#### produto
DELIMITER //
create procedure sp_inslojafaq(in pIDloja int, pIDfaq int, out mensagem varchar(150))
begin
	if ((exists(select * from faq where IDfaq = pIDfaq)) and
        (exists(select * from loja where IDloja = pIDloja)) and
        (not exists(select * from lojafaq where IDloja = pIDloja and IDfaq = pIDfaq)))
		then 
        begin
			insert into lojafaq
            values (pIDfaq,pIDloja);
            set mensagem = 'Lojafaq registrado com sucesso';
		end;
            
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altlojafaq (in pIDloja int, pIDfaq int,npIDloja int, npIDfaq int, out mensagem varchar(150))
begin
	if ((exists(select * from faq where IDfaq = npIDfaq)) and
        (exists(select * from loja where IDloja = npIDloja)) and
        (not exists(select * from lojafaq where IDloja = pIDloja and IDfaq = pIDfaq)))
		then 
        begin
            update lojafaq
            set IDfaq=npIDfaq , IDloja=npIDloja
            where IDloja = pIDloja and IDfaq = pIDfaq; 
			set mensagem = 'Lojafaq alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end

//
DELIMITER ;

#### vendas
DELIMITER //
create procedure sp_insvenda(in pdatavenda datetime, pIDfuncionario int, pIDproduto_servico int, pIDloja int, pIDconsumidor int, out mensagem varchar(150))
begin
	if ((pdatavenda is not null) and
        (pIDfuncionario is not null) and
        (pIDproduto_servico is not null) and
        (pIDloja is not null) and
        (pIDconsumidor is not null) and
        (exists(select * from funcionario where IDfuncionario = pIDfuncionario)) and
        (exists(select * from produto_servico where IDproduto_servico = pIDproduto_servico)) and
        (exists(select * from loja where IDloja = pIDloja)) and
        (exists(select * from consumidor where IDconsumidor)))
		then 
        begin
			insert into venda
            values (default, pdatavenda, pIDfuncionario, pIDproduto_servico, pIDloja, pIDconsumidor);
            set mensagem = 'Venda registrado com sucesso';
		end;
            
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altvenda(in pIDvenda int, pdatavenda datetime, pIDfuncionario int, pIDproduto_servico int, pIDloja int, pIDconsumidor int, out mensagem varchar(150))
begin
	if ((pIDvenda is not null) and
		(pdatavenda is not null) and
        (pIDfuncionario is not null) and
        (pIDproduto_servico is not null) and
        (pIDloja is not null) and
        (pIDconsumidor is not null) and
        (exists(select * from venda where IDvenda = pIDvenda)) and
        (exists(select * from funcionario where IDfuncionario = pIDfuncionario)) and
        (exists(select * from produto_servico where IDproduto_servico = pIDproduto_servico)) and
        (exists(select * from loja where IDloja = pIDloja)) and
        (exists(select * from consumidor where IDconsumidor)))
		then 
        begin
            update venda
            set dataVenda = pdatavenda, IDfuncionario = pIDfuncionario, IDproduto_servico = pIDproduto_servico, IDloja = pIDloja, IDconsumidor = pIDconsumidor 
            where IDvenda= pIDvenda;
			set mensagem = 'Venda alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end

//
DELIMITER ;

##respusu

DELIMITER //
create procedure sp_insrespusu(in pprocedimentoAdotado varchar(150), pdataResp datetime, prespEnviadaAoConsumidor varchar(150), pIDcontato int, pIDvenda int, pIDfuncionario int, out mensagem varchar(150))
begin
	if ((pdataresp is not null) and
        (prespEnviadaAoConsumidor is not null) and
        (pIDcontato is not null) and
        (pIDvenda is not null) and
        (pIDfuncionario is not null) and
        (exists(select * from contato where IDcontato = pIDcontato)) and
        (exists(select * from venda where IDvenda = pIDvenda)) and
        (exists(select * from funcionario where IDfuncionario = pIDfuncionario)))
		then 
        begin
			insert into respusu
            values (pprocedimentoAdotado, pdataresp, prespEnviadaAoConsumidor, pIDcontato, pIDvenda, pIDfuncionario);
            set mensagem = 'Respusu registrado com sucesso';
		end;
            
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end
//
DELIMITER ;

DELIMITER //
create procedure sp_altrespusu(in pprocedimentoAdotado varchar(150), pdataResp datetime, prespEnviadaAoConsumidor varchar(150), pIDcontato int, pIDvenda int, pIDfuncionario int, npIDcontato int, npIDvenda int, npIDfuncionario int, out mensagem varchar(150))
begin
	if ((pdataresp is not null) and
        (prespEnviadaAoConsumidor is not null) and
        (npIDcontato is not null) and
        (npIDvenda is not null) and
        (npIDfuncionario is not null) and
        (exists(select * from contato where IDcontato = npIDcontato)) and
        (exists(select * from venda where IDvenda = npIDvenda)) and
        (exists(select * from funcionario where IDfuncionario = npIDfuncionario)) and
        (exists(select * from respusu where IDcontato = pIDcontato and IDvenda = pIDvenda and IDfuncionario = pIDfuncionario)))
		then 
        begin
            update respusu
            set IDcontato=npIDcontato , IDvenda=npIDvenda, IDfuncionario=npIDfuncionario, dataResp = pdataResp, respEnviadaAoConsumidor = prespEnviadaAoConsumidor, procedimentoAdotado = pprocedimentoAdotado
            where IDcontato = pIDcontato and IDvenda = pIDvenda and IDfuncionario = pIDfuncionario; 
			set mensagem = 'Respusu alterado com sucesso';
		end;
	else
		set mensagem = 'Operacao nao realizada, erro';
	end if;
end

//
DELIMITER ;
