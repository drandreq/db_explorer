# Explorador de Banco de Dados

## Alegoria da Caverna de Platão - aplicado a dados de saúde [Parte I] 

A sombra à vista mostra uma clara figura que pode resolver tudo, ao seu lado um belo gráfico com diversos indicadores. Mas será que os fantoches que geram essas sombras de fato prezam por Acesso, Qualidade e Utilidade dos dados?

Para quem tem uma visão menos técnica do problema geralmente vê as seguintes sombras no fundo da caverna: "Temos um BI/dashboard", "temos muitos dados do PEP/ERP/MKT, logo podemos tirar valor deles" ou ainda "temos essa informação disponível em prontuário". 
Ao começar a olhar para fora da caverna vemos que a realidade nem sempre fora projetada corretamente.

Em qualquer jornada de dados com frequência nos deparamos com algumas das seguintes situações:
- relações de dados desconhecidos
- novos sistemas adquiridos
- dados de sistemas legados
- dados pouco explorados, documentações ausentes ou insuficientes para sua necessidade específica

Na maioria das vezes, é tentador invocar a PanaceIA (a cura para todos os males) - mas hoje ela não poderá te salvar.
O problema é mais medular e necessita de abordagens mais fundacionais.

Na disciplinas de desenvolvimento de sistemas é uma prática extremamente recomendada desenhar o diagrama de relação de tabelas antes mesmo de desenvolver a primeira linha de código. Isso permite que você possa construir o sistema seguindo as regras de "qual dado se relaciona com qual".
Por diversos motivos em saúde isso é uma dificuldade: 
- seja porque o software é fechado e a empresa proprietária não tem interesse em disponibilizar a relação de dados (mesmo que você esteja pagando por isso)
- seja porque a empresa que desenvolveu foi fazendo tantas adaptações que nem ela sabe mais como as informações se relacionam
- seja porque o sistema foi descontinuado, as equipes foram dissolvidas e nenhuma documentação sobre ele foi deixada - além dos dados que ainda têm salvos

Diante desses desafios, como podemos dar significado aos dados e conseguir enriquecê-los em prol de um melhor cuidado para o Paciente e para a Saúde do Mundo?

Vou dividir com você algo que me ajudou muito nos últimos anos. É uma abordagem técnica mas de extremo valor.

Digamos que sua empresa comprou o sistema de mapeamento de moléculas bioativas ChEMBL e a primeira coisa que o sistema apresentou foram estes belos indicadores:

<img src="imgs\ChEMBL_numbers.png" alt="ChEMBL_numbers" width="30%" height="30%">

Sendo médico, a primeira coisa que vejo é que existem 15mil medicamentos, 7mil mecanismos de ação de medicamentos, 1.4mil alertas de medicação e 49mil indicações de uso de medicações. LEGAL!! Mas...  
Mas como será que podemos tornar úteis esses dados, como essa lista de medicamentos e compostos se relacionam?

Iniciando a abordagem usando o simples código descrito no [db_explorer](https://github.com/drandreq/db_explorer) descobrimos que a base de dados do ChEMBL (disponível gratuitamente no bigquery-public-data) possui 785 tabelas diferentes e 371 colunas distintas (compartilhadas ou não entre essas tabelas).

UAU!! Lascou. rsrsrs. Não conhecemos nada dos dados do sistema e a empresa criadora não disponibilizou um diagrama de relação para entendermos como relacionar essas informações.

A ideia do [db_explorer](https://github.com/drandreq/db_explorer) é ser Plug-and-play, bem rapidamente conseguimos descobrir que a coluna "molregno" está presente em 175 tabelas, ou ainda que a coluna "component_id" está presente em 90 tabelas. 

Essa ferramenta, sem dúvidas, vai te economizar um grande tempo a custo zero!


Para dúvidas e sugestões, estou à distância de uma mensagem.