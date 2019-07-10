#primeira view abaixo
create view reclamacoes (Produto, qtdReclamacoes) as
select produto_servico.nome, count(*) as qtdReclamacoes
from produto_servico, contato, venda
where contato.IDvenda = venda.IDvenda and produto_servico.IDproduto_servico = venda.IDproduto_servico
group by produto_servico.IDproduto_servico
order by qtdReclamacoes desc;

#segunda view
create view semreclamacao (Nome, Descricao, Categoria) as
select p.nome, p.descricao, p.categoria
from venda v, produto_servico p
where v.IDproduto_servico = p.IDproduto_servico and v.IDproduto_servico not in(
select v.IDproduto_servico
    from venda v , contato c, produto_servico p
    where v.IDvenda = c.IDvenda and p.IDproduto_servico = v.IDproduto_servico and year(v.dataVenda) = '2018')
group by p.IDproduto_servico
order by p.nome,p.categoria
;
